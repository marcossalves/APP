import * as React from "react";
import {  RefreshControl, StyleSheet,ActivityIndicator, ScrollView,
  FlatList,Text, View,
  TouchableOpacity, } from "react-native";
import NumberFormat from "react-number-format";
import * as SQLite from 'expo-sqlite';



const db = SQLite.openDatabase("appvendadb.banco");
//--constante para nos ajudar a pausar a tela em quanto o indicator
// realiza a animação de girar enquanto o refreshControl atualiza a tela

const wait = (timeout) => {
  return new Promise((resolve) => {
    setTimeout(resolve, timeout);
  });
};

export default function PedidosRealizados({navigation}) {
  const [carregado, setCarregado] = React.useState(true);
  const [dados, setDados] = React.useState([]);
  const [id,setId] = React.useState("1");
  
  const [refreshing, setRefreshing] = React.useState(false);

  const onRefresh = React.useCallback(() => {
    setRefreshing(true);
    db.transaction((historicopedido)=>{
    historicopedido.executeSql("select * from perfil", [], (_, { rows:{ _array} }) => {
     setId(_array[0].idcliente.toString())
     console.log(id)
    });
    
    });
    
        fetch("http://192.168.1.7/projeto/service/historicopedido/historicopedido.php",{
          method:"POST",
          headers:{
            accept:"application/json",
            "content-type":"application/json"
          },
          body:JSON.stringify({
            idcliente:id
          })
        })
          .then((response) => response.json())
          .then((produtos) => {console.log(produtos)
          setDados(produtos.saida)})
          .catch((error) => console.error(error))
          .finally(() => setCarregado(false));
          wait(2000).then(() => setRefreshing(false));
      }, []);
  

  return (
    
    <View style={{flex:1,}}> 
         <View style={{paddingTop:10,backgroundColor:"#2ba97a",paddingBottom:10,}}>
         <Text style={tela.titulo}>Pedidos Realizados</Text>
     <Text style={tela.titulo2}>Toque na tela e arraste para baixo para atualizar os pedidos</Text>
</View>
     
     <View style={{paddingTop:10,backgroundColor:"#2ba97a"}}>

</View>

<ScrollView  style={{flex:1}}
      contentContainerStyle={{}}
      refreshControl={
        <RefreshControl refreshing={refreshing} onRefresh={onRefresh} />
      }
    >

        {carregado ? (
          <ActivityIndicator />
        ) : (
          <FlatList
            data={dados}
            renderItem={({ item }) => (
              <View style={{justifyContent:"center",alignItems:"center", backgroundColor:"#eeeeee",}}>
               <View style={tela.produtocompleto}>
              <View>
            <Text style={tela.produto}> Produto: {item.nomeproduto}</Text>
              <Text style={tela.produto}>Data: {item.datapedido}</Text>
              <Text style={tela.produto}>Quantidade: {item.quantidade}</Text>
                <View >


                
                  <Text style={tela.valor}> 
                    
                <NumberFormat
                  value={item.preco}
                  displayType={"text"}
                  thousandSeparator={true}
                  prefix={"R$ "}
                  renderText={(valor) => <Text>{valor}</Text>}
                />
</Text>
                <TouchableOpacity
               style={tela.detalhes1}
                  onPress={() => {
                    navigation.navigate("DetalheProduto", {
                      idproduto: `${item.idproduto}`,
                    });
                  }}
                >
                
                </TouchableOpacity>
                </View>
              </View>


              </View>
              </View>
            )}
            keyExtractor={({ idproduto }, index) => idproduto}
          />
        )}
      </ScrollView>
    </View>
    
  );
}

const tela = StyleSheet.create({

  conteiner: {
    //alinhar os itens um do lado do outro com flexDirection, flexWrap
    flex:1,
    flexDirection: "row",
    flexWrap: "wrap",
    justifyContent:"space-around",
    backgroundColor: "#2ba97a",

    
  },

  titulo: {
    textAlign: "center",
    borderBottomColor: "silver",
  color:"white",
    fontSize: 20,
    fontWeight: "bold",
    marginTop:10,
    marginBottom:5,
  
  },


  titulo2: {
    textAlign: "center",
    borderBottomColor: "silver",
  color:"white",
    fontSize: 10,
    fontWeight: "bold",
    marginTop:0,
    marginBottom:0,
  
  },
  produtocompleto:{
    borderColor: "silver",
    borderWidth: 2,
  //  marginVertical: 4,
   // margin:10,
    width: "80%",
    padding: 15,
    marginTop:10,
    backgroundColor: "white",
    marginBottom: 10,
   // paddingTop: 10,
  //  paddingBottom:10,
    borderRadius:20,
  
    shadowColor: "#000",
    shadowOffset: {
      width: 0,
      height: 2,
    },
    shadowOpacity: 0.25,
    shadowRadius: 3.84,
    
    elevation: 5,
  }
  ,

  detalhes1: {
    paddingVertical: 5,
    paddingHorizontal: 7,
    alignItems: "center",
  },

  detalhes2: {
    backgroundColor: "#2ba97a",
    fontSize: 15,
    fontWeight: "bold",
    paddingVertical: 5,
    paddingHorizontal: 19,
    borderRadius: 20,
    color: "#ffffff",
  },

  descricao: {
    fontWeight: "bold",
    justifyContent: "center",
    alignItems: "center",
    //backgroundColor:"red",
    margin:3,
    borderWidth:1,
    borderColor:"white",
    
  },

  produto: {
    fontWeight: "bold",
    fontSize: 15,
    textAlign:"center",
    
  },
  

  valor: {
    fontWeight: "bold",
    textAlign:"center",
    fontSize: 15,
   color:"red",
    
  },

  quantidade: {
    margin: 10,
    fontWeight: "bold",
    textAlign:"center",
    
  },
  
});
