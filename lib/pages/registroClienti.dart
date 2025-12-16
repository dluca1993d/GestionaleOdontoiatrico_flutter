import 'dart:convert';  //per convertire in JSON
import 'package:esercizi/pages/nuovoCliente.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:esercizi/pages/datiCliente.dart';

class registroClienti extends StatefulWidget{
  const registroClienti ({super.key, required this.clienti}); 
  final List<datiCliente> clienti;  //clienti=parametro del costruttore
  @override
  State<registroClienti> createState()=> _registroClienti();
}

class _registroClienti extends  State<registroClienti>{

List<datiCliente> clienti=[]; //lista che conterra tutti i clienti salvati

@override
  void initState() {
    super.initState();
    
    _caricaClienti();
  }

  //FUNZIONE X SALVARE I CLIENTI IN MEMORIA
  Future<void> _salvaClienti() async{ //Future= valore che sara disponibile in futuro
    final prefs= await SharedPreferences.getInstance(); //SharedPreferences= plugin x memorizzare dati
    List<String> clientiJson= clienti.map((c)=>jsonEncode(c.toJson())).toList(); //jsonEncode trasforma in stringa, toJson in mappa
    await prefs.setStringList("clienti", clientiJson); //salva una lista di clienti in formato testo (JSON)
  }

  //FUNZIONE X CARICARE CLIENTI SALVATI
    Future<void> _caricaClienti() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? clientiJson = prefs.getStringList('clienti');//ricarica all’avvio la lista di clienti
    if (clientiJson != null) {
      setState(() {
        clienti = clientiJson
            .map((jsonStr) =>
                datiCliente.fromJson(jsonDecode(jsonStr)))
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registro clienti"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white),
         body: ListView.builder( //genera la lista a schermo elemento x elemento
        itemCount: clienti.length, //numero di clienti nella lista
        itemBuilder: (context, index) { 
          final cliente = clienti[index];
          return ListTile( //lista che rappresenta titolo sottotitolo e tap
            title: Text("ID:#${cliente.id}  ${cliente.nome} ${cliente.cognome}"),
            subtitle: Text("Data di nascita: ${cliente.dataNascita}"),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: ()async {
                    final clienteDaModificare= clienti[index];
                     //Apri la pagina "nuovoCliente" e passa il cliente da modificare
                    final clienteAggiornato = await Navigator.push(context, MaterialPageRoute(
                    builder: (context) => nuovoCliente(cliente: clienteDaModificare),
                    ),
                  );

                    //Se l’utente ha premuto “SALVA” e ha restituito un cliente aggiornato
                    if (clienteAggiornato != null) {
                    setState(() {clienti[index] = clienteAggiornato;});
                    //Salva subito le modifiche nella memoria permanente
                    await _salvaClienti();
                    }
                    
                  },// logica modifica in registroClienti  
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () async {
                    setState(() {
                      clienti.removeAt(index); // elimina cliente
                    });
                    await _salvaClienti();
                  },
                ),
              ],
            ),
          );
        },
      ),
      );
  }
}