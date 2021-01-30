import * as React from "react";
import { Text, View } from "../components/Themed";
import { TextInput, TouchableOpacity } from "react-native-gesture-handler";
import {
  StyleSheet,
  Image,
  Alert,
} from "react-native";
import Cadastrar from "../screens/Cadastrar";
import { NavigationContainer } from "@react-navigation/native";
import { createStackNavigator } from "@react-navigation/stack";
import BottomTabNavigator from "../navigation/BottomTabNavigator";

import * as SQLite from "expo-sqlite";

const db = SQLite.openDatabase("appvendadb.banco");

const Stack = createStackNavigator();
let us = "";
let sh = "";

export default function Login() {
return(
<Stack.Navigator initialRouteName="TelaLogin">
<Stack.Screen name="TelaLogin" component={TelaLogin}/>
<Stack.Screen name="BottomTabNavigator" component={BottomTabNavigator} options={{headerTitle:'Phomo'}}/>
<Stack.Screen name="Cadastrar" component={Cadastrar}/>
</Stack.Navigator>
);
}

function TelaLogin({navigation}){
  
  const [usuario, setUsuario] = React.useState("");
  const [senha, setSenha] = React.useState("");
  const [id,setId] = React.useState("");
/////////////////
  React.useEffect(() => {

    db.transaction((tx)=>{
    tx.executeSql("select * from perfil", [], (_, { rows:{_array} }) => {
     setId(_array[0].idcliente.toString())
     if(_array[0].idcliente.equals!=null || _array[0].idcliente.equals!="")
     {
      navigation.navigate("TelaLogin")
       
     }
    });
    
    })
  })

  ////////////
  return (

    
    <View style={estilo.area}>



<Image
          source={require("../assets/images/phomo.png")}
          style={estilo.logo}
        />

        <TextInput
          placeholder="Usuário"
          style={estilo.acesso}
          onChangeText={(value) => setUsuario(value)}
          value={usuario}
        />

        <TextInput
          secureTextEntry
          placeholder="Senha"
          style={estilo.acesso}
          onChangeText={(value) => setSenha(value)}
          value={senha}
        />

        <TouchableOpacity
          style={estilo.logar}
          onPress={() => {
            us = usuario;
            sh = senha;
            if(us=="" || sh==""){
              Alert.alert("Favor informar nome de usuário e senha")
            }else{logar();   navigation.navigate("BottomTabNavigator")}
            // if(us !="" || sh !=""){Alert.alert("Seja bem vindo!")}
           
          }}
        >
          <Text style={estilo.txtLogar}> Logar </Text>
        </TouchableOpacity>

        <TouchableOpacity
          style={estilo.cadastrar}
          onPress={() => navigation.navigate("Cadastrar")}
        >
          <Text style={estilo.txtCadastrar}> Cadastrar </Text>
        </TouchableOpacity>
      
    </View>
  );

  <NavigationContainer>
    <Stack.Navigator>
      <Stack.Screen name="Cadastrar" component={Cadastrar} />
    </Stack.Navigator>
  </NavigationContainer>;
}

const estilo = StyleSheet.create({
  area: {
  
    flex: 1,
    alignContent: "center",
    justifyContent: "center",
    backgroundColor: "#2ba97a",
  
    borderColor: "#ffffff",
    //borderWidth: 1,
    //borderRadius: 20,
    
  },

  acesso: {
    backgroundColor: "white",
    color: "black",
    padding: 10,
    width: "60%",
    margin: 5,
    marginLeft: "auto",
    marginRight: "auto",
    shadowColor: "gray",
    shadowOpacity: 1,
    borderBottomWidth: 1,
    borderBottomColor: "silver",
  },

  logar: {
    width: "60%",
    paddingVertical: 10,
    paddingHorizontal: 10,
    backgroundColor: "#274ca3",
    marginLeft: "auto",
    marginRight: "auto",
    marginTop: 30,
    borderRadius:20
  },
  txtLogar: {
    color: "white",
    fontWeight: "bold",
    textAlign: "center",
    fontSize: 16,
  },

  cadastrar: {
    width: "60%",
    paddingVertical: 10,
    paddingHorizontal: 10,
    backgroundColor: "#274ca3",
    marginLeft: "auto",
    marginRight: "auto",
    marginTop: 30,
    borderColor: "#2ba97a",
    borderWidth: 1,
    borderRadius:20
   
  },
  txtCadastrar: {
    color: "white",
    fontWeight: "bold",
    textAlign: "center",
    fontSize: 16,
  },

  logo: {
    width: 200,
    height: "10%",
    marginLeft: "auto",
    marginRight: "auto",
    marginBottom: 40,
    opacity: 0.2,
  },

  fundo: {
    flex: 1,
    resizeMode: "cover",
    justifyContent: "center",
  },


});



function logar() {
  fetch("http://192.168.1.7/projeto/service/usuario/login.php", {
    method: "POST",
    headers: {
      Accept: "application/json",
      "Content-Type": "application/json",
    },
    body: JSON.stringify({
      nomeusuario: us,
      senha: sh,
    }),
  })
    .then((response) => response.json())
    .then((resposta) => {
      gravarPerfil(resposta.saida[0]);
      
      //remover (//) para ver a mensagem no console
      //Alert.alert("Olhe no console");
    })
    .catch((error) => console.error(error));
}

function gravarPerfil(dados) {
  db.transaction((tx) => {
    tx.executeSql(
      "create table if not exists perfil(id integer primary key,idcliente int, idusuario int , idendereco int, idcontato int, nomeusuario text, foto text, nomecliente text, cpf text,sexo text, email text, telefone text, tipo text, logradouro text, numero text, complemento text, bairro text, cep text, logado int);"
    );
  });
  db.transaction((tx) => {
    tx.executeSql(
      "insert into perfil(idcliente,idusuario, idendereco, idcontato, nomeusuario, foto, nomecliente, cpf,sexo, email, telefone, tipo, logradouro, numero, complemento, bairro, cep, logado)values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",
      [
        dados.idcliente,
        dados.idusuario,
        dados.idendereco,
        dados.idcontato,
        dados.nomeusuario,
        dados.foto,
        dados.nomecliente,
        dados.cpf,
        dados.sexo,
        dados.email,
        dados.telefone,
        dados.tipo,
        dados.logradouro,
        dados.numero,
        dados.complemento,
        dados.bairro,
        dados.cep,
        1,
      ]
    );

    tx.executeSql("select * from perfil", [], (_, { rows }) => {
      console.log(rows);
    });
  });
}
