import * as React from "react";
import { Text, View } from "../components/Themed";
import {  StyleSheet,} from "react-native";
import { createStackNavigator } from "@react-navigation/stack";

import MapView from 'react-native-maps';



const Stack = createStackNavigator();
export default function Contato({navigation}) {
  

  return (
    <View style={{flex:1,}}> 
     
   
         <View style={{paddingTop:10,backgroundColor:"#2ba97a",paddingBottom:10,}}>
         <Text style={tela.titulo}>Contatos</Text>

</View>


     <View style={{flexDirection: "row",flexWrap: "wrap",justifyContent:"space-around", backgroundColor:"#2ba97a",paddingTop:1,paddingBottom:4,}}>





</View>

<View>
  
<View style={{alignItems:"center"}}>

<Text style={{textAlign:"justify",margin:2,fontSize:15,fontWeight: "bold",paddingTop:20}}>Telefone: 25639898</Text>


</View>

<Text style={{textAlign:"center",fontSize: 20, fontWeight: "bold",marginTop:10,marginBottom:5,}}>Localização</Text>
<Text style={{textAlign:"center",margin:2,fontSize:15,fontWeight: "bold",paddingTop:5}}>Endereço: R. Cel. Luís Americano, 130 </Text>
<Text style={{textAlign:"center",margin:2,fontSize:15,fontWeight: "bold",paddingTop:2,paddingBottom:5}}>Tatuape, São Paulo - SP, CEP: 03308-020</Text>
<View style={{alignItems:'center',flex:1,}}>
<MapView

style={{width:"85%", height:300,}}
resizeMode={"contain"} 
  region={{
    
    latitude: -23.5409221,
    longitude: -46.5749702,
    latitudeDelta: 0.0143,
    longitudeDelta: 0.0134,
  }}
  showsUserLocation
  loadingEnabled
  />
  </View>
</View>



    



    </View>

    

    
    
  );
}

const tela = StyleSheet.create({

  titulo: {
    textAlign: "center",
    borderBottomColor: "silver",
  color:"white",
    fontSize: 20,
    fontWeight: "bold",
    marginTop:10,
    marginBottom:5,
  
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
