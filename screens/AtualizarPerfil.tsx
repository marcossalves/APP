import * as React from "react";

import { StyleSheet,Image,SectionList, Picker,ImageBackground,Alert,Text, View  } from "react-native";
import * as SQLite from "expo-sqlite";
import { ScrollView, TouchableOpacity, TextInput } from "react-native-gesture-handler";
import { createStackNavigator } from "@react-navigation/stack";

const db = SQLite.openDatabase("appvendadb.banco");
const Stack = createStackNavigator();



        let idc="idcontato";
        let ide ="idendereco";
        let idu ="idusuario";
        let em = "";
        let tel = "";
        let tp = "";
        let lg = "";
        let nu = "";
        let cp = "";
        let ba = "";
        let cep = "";
        let us = "";
        let sh = "";
        let cf = "";
        
      //apagar o perfil logado
     // db.transaction((ap) => {
       // ap.executeSql("drop table perfil");
          
        //});
export default function AtualizarPerfil({navigation}) {
  const [perfil, setPerfil] = React.useState([]);
  //const [idcontato, setIdcontato] = React.useState("");
  //const [idendereco, setIdendereco] = React.useState("");
  //const [idusuario, setIdusuario] = React.useState("");
  const [email, setEmail] = React.useState("");
  const [telefone, setTelefone] = React.useState("");
  const [tipo, setTipo] = React.useState("");
  const [logradouro, setLogradouro] = React.useState("");
  const [numero, setNumero] = React.useState("");
  const [complemento, setComplemento] = React.useState("");
  const [bairro, setBairro] = React.useState("");
  const [cepcli, setCEPcli] = React.useState("");
  const [usuario, setUsuario] = React.useState("");
  const [senha, setSenha] = React.useState("");
  const [confirmar, setConfirmar] = React.useState("");

  React.useEffect(() => {
    
    db.transaction((tx) => {
      tx.executeSql("select * from perfil", [], (_, { rows: { _array } }) => {
        setPerfil(_array);
      });

  });
  }, []);

  return (
   
    <View style={estilo.area}>


<Text style={estilo.titulo}>Alterar perfil</Text>


       



        
        <ScrollView>
        <View>
          
      {perfil.map(
        ({
          id,
          idcontato,
          idendereco,
          idusuario,
          //nomeusuario,
          //foto,
          //nomecliente,
          //cpf,
          //sexo,
          //logado,
        }) => (
          <View style={estilo.fundo}>
            

            <View style={estilo.dados}>



            
            <Text style={estilo.titulo}>Contato</Text>

<TextInput
              placeholder="E-mail"
              keyboardType="email-address"
              style={estilo.input}
              onChangeText={(value) => setEmail(value)}
              value={email}
            />

<TextInput
              placeholder="Telefone"
              keyboardType="phone-pad"
              style={estilo.input}
              onChangeText={(value) => setTelefone(value)}
              value={telefone}
            />

<TouchableOpacity
            style={estilo.cadastrar}
            onPress={() => {
      
              idc = idcontato;
              em = email;
              tel = telefone;
              if (idc=="" || em=="" || tel==""){
                Alert.alert("Todos os campos de contato devem ser preenchidos");
              }else{AtualizarContato();7}
              
            }}
          >
            <Text style={estilo.txtCadastrar}> Alterar </Text>
          </TouchableOpacity>
          </View>




          <View style={estilo.dados}>
            <Text style={estilo.titulo}>Endereço</Text>

   

            <Picker
              mode="dropdown"
              selectedValue={tipo}
              onValueChange={setTipo}
              style={estilo.input}
            >
              <Picker.Item label="Tipo" value="Tipo" />
              <Picker.Item label="Av" value="Av" />
              <Picker.Item label="Rua" value="Rua" />
              <Picker.Item label="Al" value="Al" />
              <Picker.Item label="Praça" value="Praça" />
            </Picker>
            <TextInput
              placeholder="Endereço"
              style={estilo.input}
              onChangeText={(value) => setLogradouro(value)}
              value={logradouro}
            />
            <TextInput
              placeholder="Número"
              style={estilo.input}
              onChangeText={(value) => setNumero(value)}
              value={numero}
            />
            <TextInput
              placeholder="Complemento"
              style={estilo.input}
              onChangeText={(value) => setComplemento(value)}
              value={complemento}
            />
            <TextInput
              placeholder="Bairro"
              style={estilo.input}
              onChangeText={(value) => setBairro(value)}
              value={bairro}
            />
            <TextInput
              placeholder="CEP"
              keyboardType="numeric"
              style={estilo.input}
              onChangeText={(value) => setCEPcli(value)}
              value={cepcli}
            />

<TouchableOpacity
            style={estilo.cadastrar}
            onPress={() => {
      
              ide = idendereco;
              tp = tipo;
              lg = logradouro;
              nu = numero;
              cp = complemento;
              ba = bairro;
              cep = cepcli;
              
              if (tp=="" || lg=="" || nu=="" || cp=="" || ba=="" || cep=="") {
                Alert.alert("Todos os campos endereço devem ser preenchidos");
              }else{ AtualizarEndereco();}
             
            }}
          >
            <Text style={estilo.txtCadastrar}> Alterar </Text>
          </TouchableOpacity>
</View>


<View style={estilo.dados}>

<Text style={estilo.titulo}>Alterar Senha</Text>




  <TextInput
    secureTextEntry
    placeholder="Senha"
    style={estilo.input}
    onChangeText={(value) => setSenha(value)}
    value={senha}
  />
  <TextInput
    secureTextEntry
    placeholder="Confirme"
    style={estilo.input}
    onChangeText={(value) => setConfirmar(value)}
    value={confirmar}
  />

<TouchableOpacity
  style={estilo.cadastrar}
  onPress={() => {


    idu =idusuario;
    //us = usuario;
    sh = senha;

    if(id=="" || sh==""){
      Alert.alert("Todos os campos devem ser preenchidos");
    }else{AlterarSenha();}
  
  }}
>
  <Text style={estilo.txtCadastrar}> Alterar </Text>
</TouchableOpacity>



</View> 
          </View>

          
        
        )
      )}

</View>

</ScrollView>

<View>

<TouchableOpacity
  style={estilo.sairperfil}
  onPress={() => {


    navigation.navigate("Inicial");
 }}
>
  <Text style={estilo.txtsairperfil}> Sair </Text>
</TouchableOpacity>
</View>
    </View>

    
    
  );
}


const estilo = StyleSheet.create({


  area: {
    backgroundColor: "#2ba97a",
    flex: 1,
    alignContent: "center",
    justifyContent: "center",
    borderColor: "white",
    borderWidth: 1,
    borderRadius: 20,

    
  },

  fundo: {
    flex: 1,
    resizeMode: "cover",
    justifyContent: "center",
    backgroundColor: "#2ba97a",
    
  },

  titulo: {
    textAlign: "center",
    borderBottomColor: "silver",
  color:"silver",
    fontSize: 20,
    fontWeight: "bold",
    marginTop:20,
    marginBottom:20,
    
  },

  input: {
    width: "90%",
    padding: 10,
    marginLeft: "auto",
    marginRight: "auto",
    borderBottomColor: "silver",
    borderBottomWidth: 1,
    color: "silver",
    
  },
  cadastrar: {
    width: "60%",
    backgroundColor: "#274ca3",
    paddingVertical: 10,
    paddingHorizontal: 10,
    marginTop: 20,
    marginBottom: 50,
    marginLeft: "auto",
    marginRight: "auto",
    borderRadius:20,
    

  },
  txtCadastrar: {
    color: "white",
    fontWeight: "bold",
    textAlign: "center",
    fontSize: 16,
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

  icon: {
    width: 100,
    height: 100,
    marginLeft: "auto",
    marginRight: "auto",
    marginTop:5,
    marginBottom:5,
  borderRadius:10,

  
  },


  img: {
    width: 100,
    height: 100,
   marginBottom:10,
   borderWidth:1,
   borderColor:"silver",
   borderRadius:20,
 
 
  },

alinhamentoimg: {
justifyContent:"center",
alignItems:"center",
backgroundColor:"red",
//padding:10,
borderColor:"silver",

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
    paddingVertical: 10,
    paddingHorizontal: 10,
    marginTop: 20,
    marginBottom: 50,
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
    marginTop: 20,
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


function AtualizarContato() {
  fetch("http://192.168.1.7/projeto/service/contato/alterarcontato.php", {
    method: "PUT",
    headers: {
      Accept: "application/json",
      "Content-Type": "application/json",
    },
    body: JSON.stringify({
      idcontato: idc,
      email: em,
      telefone: tel,
      
     
    }),
  })
    .then((response) => response.json())
    .then((resposta) => {
      console.log(resposta);
     // Alert.alert("Olhe na tela de console");
    })
    .catch((error) => console.error(error));
}



function AtualizarEndereco() {
  fetch("http://192.168.1.7/projeto/service/endereco/alterarendereco.php", {
    method: "PUT",
    headers: {
      Accept: "application/json",
      "Content-Type": "application/json",
    },
    body: JSON.stringify({

      idendereco: ide,
      tipo: tp,
      logradouro: lg,
      numero: nu,
      complemento: cp,
      bairro: ba,
      cep: cep,
 
     
    }),
  })
    .then((response) => response.json())
    .then((resposta) => {
      console.log(resposta);
     // Alert.alert("Olhe na tela de console");
    })
    .catch((error) => console.error(error));
}

function AlterarSenha() {
  fetch("http://192.168.1.7/projeto/service/usuario/alterarsenha.php", {
    method: "PUT",
    headers: {
      Accept: "application/json",
      "Content-Type": "application/json",
    },
    body: JSON.stringify({
      idusuario: idu,
      nomeusuario: us,
      senha: sh,
 
     
    }),
  })
    .then((response) => response.json())
    .then((resposta) => {
      console.log(resposta);
      //Alert.alert("Olhe na tela de console");
    })
    .catch((error) => console.error(error));
}


//sairPerfil();
//function sairPerfil(){
 //db.transaction((tx)=>{
 // tx.executeSql("drop table perfil");
  
//});
//alert("Sair do Perfil")
//}