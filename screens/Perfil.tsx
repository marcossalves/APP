import * as React from "react";
import { Text, View } from "../components/Themed";
import { StyleSheet,Image,RefreshControl } from "react-native";
import * as SQLite from "expo-sqlite";
import { ScrollView, TouchableOpacity } from "react-native-gesture-handler";
import { createStackNavigator } from "@react-navigation/stack";


const db = SQLite.openDatabase("appvendadb.banco");
const Stack = createStackNavigator();

//--constante para nos ajudar a pausar a tela em quanto o indicator
// realiza a animação de girar enquanto o refreshControl atualiza a tela

const wait = (timeout) => {
  return new Promise((resolve) => {
    setTimeout(resolve, timeout);
  });
};


      //apagar o perfil logado
     // db.transaction((ap) => {
      //  ap.executeSql("drop table perfil");
          
       // });

export default function Perfil({navigation}) {
  const [perfil, setPerfil] = React.useState([]);


  //---vamos criar uma constante para realizar o refresh(atualização)

  const [refreshing, setRefreshing] = React.useState(false);

  //condificação de atualização dos controles de tela

  const onRefresh = React.useCallback(() => {
    setRefreshing(true);
    db.transaction((tx) => {
      tx.executeSql("select * from perfil", [], (_, { rows: { _array } }) => {
        setPerfil(_array);
      });
    });
    wait(2000).then(() => setRefreshing(false));
  }, []);



  React.useEffect(() => {
    
    db.transaction((tx) => {
      tx.executeSql("select * from perfil", [], (_, { rows: { _array } }) => {
        setPerfil(_array);
      });

  });
  }, []);

  return (
   
    <View style={estilo.area}>
      
        
      <ScrollView  style={{flex:1}}
      contentContainerStyle={{}}
      refreshControl={
        <RefreshControl refreshing={refreshing} onRefresh={onRefresh} />
      }
    >
        <View>
          
      {perfil.map(
        ({
          id,
          idusuario,
          nomeusuario,
          foto,
          nomecliente,
          cpf,
          sexo,
          email,
          telefone,
          tipo,
          logradouro,
          numero,
          complemento,
          bairro,
          cep,
          logado,
        }) => (
          <View >
            
            <View style={estilo.alinhamentoimg}>
            <Image style={estilo.img}
              source={{ uri: `http://192.168.1.7/projeto/img/usuarios/${foto}` }}
              
            />
            <Text style={estilo.titulo}>Perfil usuário</Text>
            </View>
            
            <View style={estilo.fundo}>
                 
            <View style={estilo.dados}>
            <Text style={estilo.h1}>Dados Pessoais</Text>
            <Text style={estilo.texto}><Text style={estilo.subtexto}>Usuário:</Text>  <Text style={estilo.texto_interno}>{nomeusuario}</Text></Text>
            <Text style={estilo.texto}><Text style={estilo.subtexto}>Nome:    </Text> <Text style={estilo.texto_interno}>{nomecliente}</Text></Text>
            <Text style={estilo.texto}><Text style={estilo.subtexto}>CPF:       </Text><Text style={estilo.texto_interno}> {cpf}</Text></Text>
            <Text style={estilo.texto}><Text style={estilo.subtexto}>Sexo:      </Text> <Text style={estilo.texto_interno}>{sexo}</Text></Text>
            </View>

            <View style={estilo.dados}>
            <Text style={estilo.h1}>Contato</Text>
            <Text style={estilo.texto}><Text style={estilo.subtexto}>E-Mail:   </Text><Text style={estilo.texto_interno}> {email}</Text></Text>
            <Text style={estilo.texto}><Text style={estilo.subtexto}>Tel:         </Text><Text style={estilo.texto_interno}> {telefone}</Text></Text>
            </View>
            
            <View style={estilo.dados} >
            <Text style={estilo.h1}>Contato</Text>
            <Text style={estilo.texto}><Text style={estilo.subtexto}>Tipo:      </Text><Text style={estilo.texto_interno}> {tipo}</Text></Text>
            <Text style={estilo.texto}><Text style={estilo.subtexto}>Endereço:</Text><Text style={estilo.texto_interno}>{logradouro}</Text></Text>
            <Text style={estilo.texto}><Text style={estilo.subtexto}>Número: </Text><Text style={estilo.texto_interno}>{numero}</Text></Text>
            <Text style={estilo.texto}><Text style={estilo.subtexto}>Complemento: </Text ><Text style={estilo.texto_interno}> {complemento}</Text></Text>
            <Text style={estilo.texto}><Text style={estilo.subtexto}>Bairro: </Text><Text style={estilo.texto_interno}>{bairro}</Text></Text>
            <Text style={estilo.texto}><Text style={estilo.subtexto}>Cep:     </Text><Text style={estilo.texto_interno}>{cep}</Text></Text>
            </View>
          </View>
          
          
           
          </View>
        
        )
      )}






</View>
</ScrollView>

<TouchableOpacity style={estilo.alterarperfil} onPress={() => {
            navigation.navigate("AtualizarPerfil");
          }}
        >
              <Text style={estilo.txtalterarperfil}>Atualizar Perfil</Text>
            </TouchableOpacity>


            <TouchableOpacity
            style={estilo.sairperfil}
            onPress={() => {
             
               sairPerfil();
               navigation.navigate("TelaLogin");
            }}
          >
            <Text style={estilo.txtsairperfil}> Sair </Text>
          </TouchableOpacity>
         
    </View>
    
    
  );
}



const estilo = StyleSheet.create({
  area: {
    backgroundColor: "#2ba97a",
    flex: 1,
    borderColor: "white",
 
    
  },


  titulo: {
    textAlign: "center",
    borderBottomColor: "silver",
  color:"white",
    fontSize: 20,
    fontWeight: "bold",
    marginTop:0,
    marginBottom:5,
    
  },

  img: {
    width: 100,
    height: 100,
    marginLeft: "auto",
    marginRight: "auto",
    marginTop:10,
    marginBottom:5,
  borderRadius:10,
 
 
  },

  fundo: {
    flex: 1,
    resizeMode: "cover",
    justifyContent: "center",
    backgroundColor: "#2ba97a",
    
  },

alinhamentoimg: {
justifyContent:"center",
alignItems:"center",
//backgroundColor:"red",
backgroundColor: "#2ba97a",
//padding:10,
borderColor:"silver",
  },
  

  dados: {
    borderColor: "silver",
    borderWidth: 1,
    marginVertical: 5,
    width: "95%",
    padding: 5,
    marginLeft: "auto",
    marginRight: "auto",
    borderRadius: 5,
    backgroundColor: "white",
    marginBottom: 10,
    paddingTop: 20,
    
  },


  h1:{
    fontSize: 16,
    fontWeight: "bold",
    textAlign:"center",
    borderColor: "silver",
    
    width: "90%",
    padding: 10,
    marginLeft: "auto",
    marginRight: "auto",
    borderBottomColor: "silver",
    borderBottomWidth: 1,
    color: "silver",
  },

  subtexto:{
    fontSize: 16,
    fontWeight: "bold",
    width: "90%",
    padding: 10,
    marginLeft: "auto",
    marginRight: "auto",
    borderBottomColor: "silver",
    borderBottomWidth: 1,
    color: "silver",
    
  },

  texto:{
    fontSize: 16,
    width: "90%",
    padding: 10,
    marginLeft: "auto",
    marginRight: "auto",
    borderBottomColor: "silver",
    borderBottomWidth: 1,
    color: "silver",
    
    
  },

  alterarperfil: {
    width: "60%",
    backgroundColor: "#274ca3",
    paddingVertical: 12,
    paddingHorizontal: 10,
    marginTop: 10,
    marginBottom: 10,
    marginLeft: "auto",
    marginRight: "auto",
    borderRadius:20,
  

  },
  txtalterarperfil: {
    color: "white",
    fontWeight: "bold",
    textAlign: "center",
    fontSize: 16,
  },
  



  sairperfil: {
    width: "60%",
    backgroundColor: "#274ca3",
    paddingVertical: 10,
    paddingHorizontal: 10,
    marginTop: 2,
    marginBottom: 10,
    marginLeft: "auto",
    marginRight: "auto",
    borderRadius:20,
    

  },
  txtsairperfil: {
    color: "white",
    fontWeight: "bold",
    textAlign: "center",
    fontSize: 16,
  },

});

sairPerfil();
function sairPerfil(){
 db.transaction((tx)=>{
  tx.executeSql("drop table perfil");
  
});
//alert("Sair do Perfil")
}