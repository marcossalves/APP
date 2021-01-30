import * as React from "react";
import { Text, View } from "../components/Themed";
import { Image, StyleSheet, ActivityIndicator, Button,SafeAreaView } from "react-native";
import {
  ScrollView,
  FlatList,
  TouchableOpacity,
} from "react-native-gesture-handler";
import NumberFormat from "react-number-format";
import { createStackNavigator } from "@react-navigation/stack";
import DetalheProduto from "./DetalheProduto";
import Cadastrar from "./Cadastrar";
import AtualizarPerfil from "./AtualizarPerfil";
import Pagamento from "./Pagamento";
import ConfirmacaoPagamento from "./ConfirmacaoPagamento";
import Login from "./Login";
import Contato from "./Contato";
import Perfil from "./Perfil";



const Stack = createStackNavigator();

export default function Inicial({Route}) {
  return (
    <Stack.Navigator initialRouteName="Produtos">
      <Stack.Screen name="Produtos" component={Produtos} />
      <Stack.Screen name="DetalheProduto" component={DetalheProduto} /> 
      <Stack.Screen name="Cadastrar" component={Cadastrar} />
      <Stack.Screen name="AtualizarPerfil" component={AtualizarPerfil} />
      <Stack.Screen name="Pagamento" component={Pagamento} />
      <Stack.Screen name="Login" component={Login} />
      <Stack.Screen name="Contato" component={Contato} />
      <Stack.Screen name="ConfirmacaoPagamento" component={ConfirmacaoPagamento} />
      <Stack.Screen name="Inicial" component={Inicial} />
      <Stack.Screen name="Perfil" component={Perfil} />
      
    </Stack.Navigator>
  );
}

function Produtos({ navigation }) {
  const [carregado, setCarregado] = React.useState(true);
  const [dados, setDados] = React.useState([]);

  //Carregar a api com os dados do banco de dados.
  //Executar a consulta listartelainicial

  React.useEffect(() => {
    fetch("http://192.168.1.7/projeto/service/produto/listartelainicial.php")
      .then((response) => response.json())
      .then((produtos) => setDados(produtos.saida))
      .catch((error) => console.error(error))
      .finally(() => setCarregado(false));
  }, []);

  return (
    <View style={{flex:1,}}> 
     
     <View style={{paddingTop:10,backgroundColor:"#2ba97a",paddingBottom:10,}}>
      <Image
          source={require("../assets/images/phomo.png")}
          style={{width:"100%", height:60,backgroundColor:"#2ba97a",}}
          resizeMode={"contain"}
        />
</View>





<View>


</View>
    
      <ScrollView >
        


        {carregado ? (
          <ActivityIndicator />
        ) : (
          <FlatList
            data={dados}
            renderItem={({ item }) => (
              <View style={{justifyContent:"center",alignItems:"center", backgroundColor:"#eeeeee",}}>
               <View style={tela.produtocompleto}>
              <View>
              <Text style={tela.produto}>{item.nomeproduto}</Text>
                <Image 
                  source={{
                    uri: `http://192.168.1.7/projeto/img/${item.foto}`,
                  }}
                  style={{width:"100%", height:140,}}
                  resizeMode={"contain"}
                />

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
                 <Text style={tela.detalhes2}> Detalhes </Text>
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

  imagem: {
   // marginTop:20,
   // marginBottom:20,
    
   // width: "65%",
  //  height: 80,
  //  backgroundColor: "#2ba97a",

  //  paddingBottom:10,
   
  },

  //area: {
   // backgroundColor: "#2ba97a",
   // flex: 1,
   // borderColor: "white",
   // borderWidth: 1,
   // borderRadius: 20,
    
  //},

  //titulo: {
   // textAlign: "center",
    //borderBottomColor: "silver",
    //color:"white",
    //fontSize: 20,
    //fontWeight: "bold",
    //marginTop:20,
    //marginBottom:20,
  
  //},

  alinhamentotextoquantidade:{
    //flexDirection: "row",
    //flexWrap: "wrap",
    //justifyContent:"center",
  },

  conteiner: {
    //alinhar os itens um do lado do outro com flexDirection, flexWrap
    //flex:1,
    //flexDirection: "row",
    //flexWrap: "wrap",
    //justifyContent:"space-around",
    //backgroundColor: "#2ba97a",

    
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
  
   // shadowColor: "#000",
  //shadowOffset: {
  //width: 0,
  // height: 2,
  //  },
  //  shadowOpacity: 0.25,
   // shadowRadius: 3.84,
    
   // elevation: 5,
  
 

  }
  ,


  detalhes1: {
    paddingVertical: 5,
    paddingHorizontal: 7,
    alignItems: "center",
  },

  detalhes2: {
    backgroundColor:  "#274ca3",
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
