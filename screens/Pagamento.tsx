import * as React from "react";
import { Text, View } from "../components/Themed";
import {
  
  Picker,
  Button,
  StyleSheet,
  Image,
  Alert,
  ImageBackground,
  ImagePropTypes,
} from "react-native";

import { TextInput, TouchableOpacity } from "react-native-gesture-handler";

import * as SQLite from "expo-sqlite";

const db = SQLite.openDatabase("appvendadb.banco");

let idc = 0;
let tp = "";
let ds = "";
let vl = "";
let qp = 0;
let vp = "";
//let pr = "";
let total = "";

export default function Pagamento({ navigation }) {
  const [idcliente, setIdCliente] = React.useState(0);
  const [tipo, setTipo] = React.useState("");
  const [descricao, setDescricao] = React.useState("");
  const [valor, setValor] = React.useState("");
  const [parcelas, setParcelas] = React.useState(1);
  const [vParcela, setVParcelas] = React.useState("");
  const [produtos, setProdutos] = React.useState([]);
  

  // constantes de passagem de dados

  
  
 

  React.useEffect(() => {
    db.transaction((tx) => {
      tx.executeSql(
        "select idcliente from perfil",
        [],
        (_, { rows: { _array } }) => {
          setIdCliente(_array[0].idcliente.toString());
          console.log(_array);
        }
      );

        tx.executeSql("select * from itens", [], (_, { rows: { _array } }) => {
          setProdutos(_array);
          console.log(_array);
        });

      //Vamos fazer uma nova consulta para calcular o valor total dos produtos no carrinho
      tx.executeSql(
        "select sum(preco) as total from itens",
        [],
        (_, { rows: { _array } }) => {
          setValor(_array[0].total.toString());
          console.log(_array[0].total.toString());
        }
      );
    });
  }, []);

  return (
    <View style={tela.container}>
      <Text style={tela.titulo}>Forma de pagamento</Text>

      <View style={tela.tipo_pagamento}> 
      <Picker selectedValue={tipo} mode="dropdown" onValueChange={setTipo}>    
        <Picker.Item   label="Boleto" value="Boleto" />
        <Picker.Item label="Crédito" value="Crédito" />
        <Picker.Item label="Débito" value="Débito" />
      </Picker>
      </View>
       <Text style={tela.titulo}>Descrição do pagamento</Text>
      <TextInput  style={tela.descricao_pagamento}
        placeholder="Descrição do pagamento"
        value={descricao}
        onChangeText={(value) => setDescricao(value)}
      />
      <Text style={tela.titulo}>Valor da compra</Text>

      <View style={tela.valor_compra}>
      <TextInput
        keyboardType="decimal-pad"
        placeholder="R$ 00"
        value={valor}
        onChangeText={(value) => setValor(value)}
      /></View>

      <Text style={tela.titulo}>Selecione as parcelas</Text>

      <View style={tela.selecao_parcelas}>
      <Picker
        selectedValue={parcelas}
        mode="dropdown"
        onValueChange={(parcelas) => {
          setParcelas(parcelas);
          setVParcelas((parseFloat(valor) / parcelas).toString());
        }}
      >
        <Picker.Item label="1" value="1" />
        <Picker.Item label="2" value="2" />
        <Picker.Item label="3" value="3" />
        <Picker.Item label="4" value="4" />
        <Picker.Item label="5" value="5" />
        <Picker.Item label="6" value="6" />
        <Picker.Item label="7" value="7" />
        <Picker.Item label="8" value="8" />
        <Picker.Item label="9" value="9" />
        <Picker.Item label="10" value="10" />
      </Picker>
      </View>


      <Text style={tela.titulo}>Valor da parcela</Text>
     <View style={tela.valor_parcela}>
      <TextInput
        keyboardType="decimal-pad"
        placeholder="R$ 00"
        value={vParcela}
        onChangeText={(value) => setVParcelas(value)}
      />
      </View>
      


      <TouchableOpacity
        onPress={() => {
          // passagens de dados do formulário para as variáveis e depois cadastro do pgamento
          idc = idcliente;
          tp = tipo;
          ds = descricao;
          vl = valor;
          qp = parcelas;
          vp = vParcela;
        // pr = produtos;
        
          efetuarPagamento();

          navigation.navigate("ConfirmacaoPagamento");
        }}
      >
        <Text style={tela.pagamento}>Pagar</Text>
      </TouchableOpacity>
      
    </View>
  );
}


const tela = StyleSheet.create({
  container: {
    backgroundColor: "#2ba97a",
    flex: 1,
    alignContent: "center",
    justifyContent: "center",
    borderColor: "white",
    borderWidth: 5,
    borderRadius: 20,
    
  
  },

  titulo: {
textAlign:"center",
fontSize: 16,
fontWeight: "bold",
color:"white",
padding:5,
  
  },

  tipo_pagamento:{
backgroundColor:"white",
borderWidth:2,
borderColor:"silver",
borderRadius:10,
margin:10,


      },


      descricao_pagamento:{
        backgroundColor:"white",
        borderWidth:2,
        borderColor:"silver",
        paddingVertical: 11,
        paddingHorizontal: 10,
        borderRadius:10,
        margin:10,
        textAlign:"center",
        
              },


      valor_compra:{
        backgroundColor:"white",
        borderWidth:2,
        borderColor:"silver",
        paddingVertical: 11,
        paddingHorizontal: 10,
        borderRadius:10,
        margin:10,
        alignItems:"center",
        
              },


              selecao_parcelas:{
                backgroundColor:"white",
                borderWidth:2,
                borderColor:"silver",
                borderRadius:10,
                margin:10,
                
                
                      },

                      valor_parcela:{
                        backgroundColor:"white",
                        borderWidth:2,
                        borderColor:"silver",
                        paddingVertical: 11,
                        paddingHorizontal: 10,
                        borderRadius:10,
                        margin:10,
                        alignItems:"center",
                              },

                              pagamento: {
                                width: "60%",
                                paddingVertical: 10,
                                paddingHorizontal: 10,
                                backgroundColor: "#274ca3",
                                marginLeft: "auto",
                                marginRight: "auto",
                              
                                borderRadius:20,
                                color: "white",
                                fontWeight: "bold",
                                textAlign: "center",
                                fontSize: 16,
                                margin:10,
                               
                               
                              },
    
});



function efetuarPagamento() {
  fetch("http://192.168.1.7/projeto/service/pagamento/cadastro.php", {
    method: "POST",
    headers: {
      Accept: "application/json",
      "Content-Type": "application/json",
    },
    body: JSON.stringify({
      idcliente: idc,
      tipo: tp,
      descricao: ds,
      valor: vl,
      parcelas: qp,
      valorparcela: vp,
     // produto: ipr,
    }),
  })
    .then((response) => response.json())
    .then((resposta) => {
      console.log(resposta);
      alert("Seu pagamento foi efetuado");
    })
    .catch((error) => console.error(error));

  limparCarrinho();
}

function limparCarrinho() {
  db.transaction((tx) => {
    tx.executeSql("delete from itens");
  });
}
