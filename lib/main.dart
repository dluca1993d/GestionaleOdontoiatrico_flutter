//ACCEDO AL PACCHETTO MATERIAL
import 'package:flutter/material.dart';
import 'pages/pages.dart';

//PUNTO DI ACCESSO ALLA MIA APP
void main() {
  runApp(const MyApp());  //con "const" la mia app e immutabile
}

// 1 CLASSE MADRE DELL'APP
class MyApp extends StatelessWidget{
  const MyApp({super.key});  //il costruttore MyApp usa 'key' x non ricostruire tutto da 0 in caso di modifiche
//  
  @override
  Widget build(BuildContext context) {
   return MaterialApp(  
    title: "Gestionale",
    theme: ThemeData(primaryColor: Colors.blue),
    home: const HomePage(),  //dico a flutter cosa mostrarmi appena apro l 'app
   );
  }
}
