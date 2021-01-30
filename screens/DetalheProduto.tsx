import * as React from "react";
import { Text, View } from "../components/Themed";
import { ActivityIndicator, Image, StyleSheet } from "react-native";
import { FlatList, TouchableOpacity } from "react-native-gesture-handler";

import * as SQLite from "expo-sqlite";

export default function DetalheProduto({ route }) {
  const { idproduto } = route.params;
  const [carregado, setCarregado] = React.useState(true);
  const [dados, setDados] = React.useState([]);

  React.useEffect(() => {
    fetch(
      `http://192.168.1.7/projeto/service/produto/detalheproduto.php?idproduto=${idproduto}`
    )
      .then((response) => response.json())
      .then((produto) => setDados(produto.saida))
      .catch((error) =>
        console.error(`Erro ao tentar carregar o produto ${error}`)
      )
      .finally(() => setCarregado(false));
  }, []);

  return (
    <View style={tela.container}>
      <View style={tela.alinhamento_produtos}> 
      {carregado ? (
        <ActivityIndicator />
      ) : (
        <FlatList
          data={dados}
          renderItem={({ item }) => (
            <View>

              
              <Image
              style={tela.img1}
                source={{ uri: `http://192.168.1.7/projeto/img/${item.foto1}` }}
              />

<Image
                source={{ uri: `http://192.168.1.7/projeto/img/${item.foto2}` }}
                style={tela.img1}
              />

<Image
                source={{ uri: `http://192.168.1.7/projeto/img/${item.foto3}` }}
                style={tela.img1}
              />

<Image
                source={{ uri: `http://192.168.1.7/projeto/img/${item.foto4}` }}
                style={tela.img1}
              />

<View style={tela.container_descricao}>
              <Text style={tela.produto}>{item.nomeproduto}</Text>
              <Text style={tela.descricao3}>{item.descricao}</Text>
              <Text style={tela.valor}>R$: {item.preco}</Text>

              <TouchableOpacity
              style={tela.adicionar_carrinho1}
                onPress={() => {
                  adicionarAoCarrinho(
                    `${idproduto}`,
                    `${item.nomeproduto}`,
                    `${item.preco}`,
                    `${item.foto1}`
                  );
                }}
                style={tela.link}
              >
               <Text style={tela.adicionar_carrinho2}>{" "}Adicionar ao Carrinho{" "}</Text>
              </TouchableOpacity>
              </View>
              
            </View>
            
            
          )}
          keyExtractor={({ idproduto }, index) => idproduto}
        />
      )}
    </View>
    </View>
  );
}
const tela = StyleSheet.create({
  container: {
    flex: 1,
   // margin:10,
  //borderRadius:20,
  //borderColor:"#4caf50",
  backgroundColor: "#2ba97a",
 

  
  },

  alinhamento_produtos: {
margin:10,
borderWidth:5,
borderRadius:10,
borderColor:"white",

paddingBottom:20,
flex:1,
  },

  img1: {
   
    height: 150,
    margin: 30,
    marginStart: 75,
      borderColor: "#4caf50",
      borderWidth: 2,
    //  marginVertical: 4,
     // margin:10,
      width: "50%",
      padding: 15,
      marginTop:10,
      backgroundColor: "white",
      marginBottom: 10,
     // paddingTop: 10,
    //  paddingBottom:10,
      borderRadius:20,
    
  
    
   

    
  },

  container_descricao: {
    justifyContent: "center",
    alignItems: "center",
    
    
  },

  descricao1: {
    textAlign: "center",
    fontWeight: "bold",
    fontSize: 16,
    
  },

  descricao2: {
    textAlign: "justify",
    margin: 6,
    
  },

  descricao3: {
    textAlign: "justify",
    margin: 10,
    
  },

  produto: {
    fontSize: 16,
    textAlign: "center",
    fontWeight: "bold",
    
  },

  valor: {
    fontWeight: "bold",
    color: "red",
    fontSize: 16,
    
  },

  adicionar_carrinho1: {
    paddingVertical: 5,
    paddingHorizontal: 52,
    alignItems: "center",
    
  },

  adicionar_carrinho2: {
    
    backgroundColor: "#274ca3",
    fontSize: 15,
    fontWeight: "bold",
    paddingVertical: 10,
    paddingHorizontal: 10,
    borderRadius: 20,
    margin: 1,
    color: "#ffffff",
    

  },

  link: {
    padding: 10,
  },
});
//Fazer a constante do banco de dados. Vamos chamarde db

const db = SQLite.openDatabase("appvendadb.banco");

function adicionarAoCarrinho(id, nome, preco, foto) {
  db.transaction((tx) => {
    tx.executeSql(
      "create table if not exists itens(id integer primary key,idproduto int,nomeproduto text, preco text, foto text);"
    );
  });

  db.transaction((tx) => {
    tx.executeSql(
      "insert into itens(idproduto,nomeproduto,preco,foto)values(?,?,?,?)",
      [id, nome, preco, foto]
    );
    tx.executeSql("select * from itens", [], (_, { rows }) => {
      console.log(JSON.stringify(rows));
    });
    //tx.executeSql("drop table itens");
  });
}
