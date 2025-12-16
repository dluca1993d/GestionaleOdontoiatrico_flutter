import 'dart:convert'; // per convertire in JSON
import 'package:esercizi/pages/nuovoCliente.dart';
import 'package:esercizi/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState()=> _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
// Questa lista funge da "ponte" tra la pagina nuovoCliente e la pagina registroClienti. Inizialmente è vuota, ma verrà riempita con i nuovi clienti creati. La variabile clients è definita qui (in HomePage) ed è diversa dalla variabile "clienti" definita all’interno di registroClienti (che gestisce la sua copia locale dei dati).
  List<datiCliente> clients = []; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gestionale Odontoiatrico"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,),
      floatingActionButton:
        Align(
          alignment: Alignment(0,0.8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            
            children: [
              ElevatedButton(onPressed: (){
                setState(() {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> registroClienti(clienti:clients))); //nome del parametro del costrtuttore : variabile che sto passando(definita in home). Qui dico=passa la lista della variabile clients (in home) al parametro clienti (in registroClienti), poiche la home fa da ponte tra nuovoCliente e registroClienti anche essa deve salvare i dati del nuovoCliente per poi darli al registro.
                });
              }, 
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(132, 33, 149, 243),
                  foregroundColor: Colors.white),
                  child: Text("REGISTRO CLIENTI"),),
              SizedBox(width: 100),

              //tutto cio che e in {} fa operazioni che richiedono tempo= asincrone.
              FloatingActionButton(onPressed: ()async{ 
              //await= aspetta la compilazione del nuovoCliente poi prendi il cliente che ti viene dato.
                var nuovo= await Navigator.push(context, MaterialPageRoute(builder:(context)=> nuovoCliente
                //null=se premo cancella o torno indietro senza salvare.
                (cliente:null)),);
                //non null= se premo salva si aggiunge un nuovo cliente alla lista clients.
                if (nuovo != null) {
                  clients.add(nuovo);
              //Salva subito i nuovi clienti
                final prefs = await SharedPreferences.getInstance();
                //trasforma ogni cliente (c) in una stringa JSON. 
                //c.toJson() prende l’oggetto datiCliente e lo converte in mappa
                //jsonEncode(...)  converte quella mappa in una stringa leggibile.
                //.toList() trasforma il risultato in una lista di stringhe.
                List<String> clientiJson =clients.map((c) => jsonEncode(c.toJson())).toList();
                //salva la lista di stringhe in memoria permanente, anche se chiudo l'app restano salvati.
                await prefs.setStringList("clienti", clientiJson);  
                }
              },
                
                backgroundColor: Color.fromARGB(132, 33, 149, 243),
                foregroundColor: Colors.white,
                child: Icon(Icons.add),
                ),
            ],
          ),
        ),
        
        
      body: Stack(
      children: [
        Positioned.fill(
        child: Image.asset(
        "assets/riunito.jpg",
        fit: BoxFit.cover,
       ),
     ),
        Positioned(
          top: 16,  
          left: 16, 
          child: PopupMenuButton(
            offset: Offset(5, 47),
            onOpened: () {},
            itemBuilder: (BuildContext context) { 
              return [
                PopupMenuItem(
                  child: Text("Prestazioni"), 
                  onTap: (){Future.delayed(Duration.zero, (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Prestazioni())
                  );
                });
              },
            ),
                PopupMenuItem(
                  child: Text("Preventivi"),
                  onTap: (){Future.delayed(Duration.zero, (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Preventivi())
                  );
                });
              }),
               PopupMenuItem(
                  child: Text("Cartella Clinica"), 
                  onTap: (){Future.delayed(Duration.zero, (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>CartellaClinica())
                  );
                });
              },
            ),];
             },
            icon: Image.asset("assets/iconahome.png",
            width: 40, 
            height: 40,
            ), 
          ),
        ),
      ],
    ),
  );
}
}
