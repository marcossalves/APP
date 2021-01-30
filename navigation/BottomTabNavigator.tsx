import { Ionicons, FontAwesome5 } from "@expo/vector-icons";
import { createBottomTabNavigator } from "@react-navigation/bottom-tabs";
import { createStackNavigator } from "@react-navigation/stack";
import * as React from "react";
import { FontAwesome } from "@expo/vector-icons";
import { Foundation } from "@expo/vector-icons";

import Colors from "../constants/Colors";
import useColorScheme from "../hooks/useColorScheme";

import Inicial from "../screens/Inicial";
import Perfil from "../screens/Perfil";
import AtualizarPerfil from "../screens/AtualizarPerfil";
import Carrinho from "../screens/Carrinho";
import PedidosRealizados from "../screens/PedidosRealizados";
import Acessorios from "../screens/Acessorios";
import Login from "../screens/Login";
import Cadastrar from "../screens/Cadastrar";
import Contato from "../screens/Contato";
import Pagamento from "../screens/Pagamento";

import { BottomTabParamList, TabOneParamList, TabTwoParamList } from "../types";

const BottomTab = createBottomTabNavigator<BottomTabParamList>();

export default function BottomTabNavigator() {
  const colorScheme = useColorScheme();

  return (
    <BottomTab.Navigator
      initialRouteName="Inicial"
      tabBarOptions={{ activeTintColor: Colors[colorScheme].tint }}
    >
      <BottomTab.Screen
        name="Incio"
        component={InicialNavegador}
        options={{
          tabBarIcon: ({ color }) => (
            <FontAwesome5 name="home" size={24} color="#4caf50" />
          ),
        }}
      />

      <BottomTab.Screen
        name="Carrinho"
        component={CarrinhoNavegador}
        options={{
          tabBarIcon: ({ color }) => (
            <Foundation name="shopping-cart" size={26} color="#4caf50" />
          ),
        }}
      />

      {/* <BottomTab.Screen
        name="Pedidos"
        component={PedidosRealizadosNavegador}
        options={{
          tabBarIcon: ({ color }) => (
            <FontAwesome5 name="gifts" size={24} color="#4caf50" />
          ),
        }}
      /> */}

<BottomTab.Screen
        name="Perfil"
        component={PerfilNavegador}
        options={{
          tabBarIcon: ({ color }) => (
            <FontAwesome name="eye" size={24} color="#4caf50" />
          ),
        }}
      />



<BottomTab.Screen
        name="Contato"
        component={ContatoNavegador}
        options={{
          tabBarIcon: ({ color }) => (
            <FontAwesome name="whatsapp" size={24} color="#4caf50" />
          ),
        }}
      />
  

 

    </BottomTab.Navigator>





  );
}

// You can explore the built-in icon families and icons on the web at:
// https://icons.expo.fyi/
function TabBarIcon(props: { name: string; color: string }) {
  return <Ionicons size={30} style={{ marginBottom: -3 }} {...props} />;
}

function TabBarIcon2(props: { name: string; color: string }) {
  return <FontAwesome5 size={30} style={{ marginBottom: -3 }} {...props} />;
}

// Each tab has its own navigation stack, you can read more about this pattern here:
// https://reactnavigation.org/docs/tab-based-navigation#a-stack-navigator-for-each-tab

const InicialStack = createStackNavigator();
function InicialNavegador() {
  return (
    <InicialStack.Navigator>
      <InicialStack.Screen
        name="Inicial"
        component={Inicial}
        options={{ headerTitle: "" }}
      />
    </InicialStack.Navigator>
  );
}

const PerfilStack = createStackNavigator();
function PerfilNavegador() {
  return (
    <PerfilStack.Navigator>
      <PerfilStack.Screen
        name="Perfil"
        component={Perfil}
        options={{ headerTitle: "" }}
      />
    </PerfilStack.Navigator>
  );
}



const CarrinhoStack = createStackNavigator();
function CarrinhoNavegador() {
  return (
    <CarrinhoStack.Navigator>
      <CarrinhoStack.Screen
        name="Carrinho"
        component={Carrinho}
        options={{ headerTitle: "" }}
      />
    </CarrinhoStack.Navigator>
  );
}

/* const PedidosRealizadosStack = createStackNavigator();
function PedidosRealizadosNavegador() {
  return (
    <PedidosRealizadosStack.Navigator>
      <PedidosRealizadosStack.Screen
        name="PedidosRealizados"
        component={PedidosRealizados}
        options={{ headerTitle: "" }}
      />
    </PedidosRealizadosStack.Navigator>
  );
}
*/



const ContatoStack = createStackNavigator();
function ContatoNavegador() {
  return (
    <ContatoStack.Navigator>
      <ContatoStack.Screen
        name="Contato"
        component={Contato}
        options={{ headerTitle: "" }}
      />
    </ContatoStack.Navigator>
  );
}









