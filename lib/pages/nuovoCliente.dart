import 'package:esercizi/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class nuovoCliente extends StatefulWidget{
// La pagina nuovoCliente può ricevere un oggetto di tipo datiCliente, che può essere null o non null (ecco perche il ?). È null quando si crea un nuovo cliente (premendo il FloatingActionButton nella Home) e non null quando si modifica un cliente esistente (premendo il tasto Modifica in registroClienti).
  final datiCliente? cliente;
  const nuovoCliente({super.key, this.cliente});
  @override
  State<nuovoCliente> createState()=> _nuovoCliente();
}

class _nuovoCliente extends State<nuovoCliente> {

//dichiaro la variabile(ultimoid) e la inizializzo con 0 (vaslore di defoult). Serve a tenere traccia dell'ultimo ID
int ultimoid=0;
//definisco una funzione privata asincrona. Future<void> indica che la funzione può richiedere del tempo per completarsi. Questa funzione serve a caricare l’ultimo ID usato dai dati salvati sul dispositivo, in modo che ogni nuovo cliente possa avere un ID univoco incrementale.
   Future<void> _leggiUltimoId() async{ 
    final prefs= await SharedPreferences.getInstance();
    ultimoid= prefs.getInt("ultimoId")??0;//legge ultimo id salvato
  }

//TextEditingController CONTROLLA TextFormField(memorizza,legge,modifica o svuota il contenuto)
  final nomeController=TextEditingController();  
  final cognomeController=TextEditingController();
  final dataNascitaController=TextEditingController();
  final cfController=TextEditingController(); 
  final telefonoController=TextEditingController();
  final emailController=TextEditingController();
  final viaController=TextEditingController();
  final capController=TextEditingController();
  final cittaController=TextEditingController();
  final provinciaController=TextEditingController();
  final registrazioneController=TextEditingController();
  final noteController=TextEditingController();

//Se modifico un cliente posso compilare i campi gia presenti (senza questo codice, premendo modofica, non tiene i casmpi salvati ma mi fa patire da zero). initState agisce nel momento in cui i campi vengono modificati, ridisegnando l'app.
  @override
void initState() {
  super.initState();
  if (widget.cliente != null) {
    nomeController.text = widget.cliente!.nome;
    cognomeController.text = widget.cliente!.cognome;
    dataNascitaController.text = widget.cliente!.dataNascita;
    cfController.text = widget.cliente!.cf;
    telefonoController.text = widget.cliente!.telefono;
    emailController.text = widget.cliente!.email;
    viaController.text = widget.cliente!.via;
    capController.text = widget.cliente!.cap;
    cittaController.text = widget.cliente!.citta;
    provinciaController.text = widget.cliente!.provincia;
    registrazioneController.text = widget.cliente!.registrazione;
    noteController.text = widget.cliente!.note;
  }
}

//DISPOSE SERVE A CHIUDERE I CONTROLLER CHE ALTRIMENTI RIMARREBBERO IN MEMORIA E RALLENTEREBBERO L'APP
    @override
    void dispose(){
      nomeController.dispose();
      cognomeController.dispose();
      dataNascitaController.dispose();
      cfController.dispose();
      telefonoController.dispose();
      emailController.dispose();
      viaController.dispose();
      capController.dispose();
      cittaController.dispose();
      provinciaController.dispose();
      registrazioneController.dispose();
      noteController.dispose();
      super.dispose();
    }

//CLEAR SVUOTA IL TESTO NEL CONTROLLER (collegato al bottone cancella)
    void cancellaCampi() {
  nomeController.clear();
  cognomeController.clear();
  dataNascitaController.clear();
  cfController.clear();
  telefonoController.clear();
  emailController.clear();
  viaController.clear();
  capController.clear();
  cittaController.clear();
  registrazioneController.clear();
  provinciaController.clear();
  noteController.clear();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nuovo cliente"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(35.0),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: () async {
//serve per memorizzare l'ID che sara assegnato al cliente
                  //1- Se stiamo modificando un cliente esistente (widget.cliente non null) si mantiene stesso ID
                  if (widget.cliente != null) {
//si mantiene stesso ID
                  } else {
                  //2-altrimenti se nuovo cliente (widget.cliente null) legge, incrementa e assegna l'ID incrementato rispetto l'ultimo
                  await _leggiUltimoId(); //legge (dalla memoria SharedPreferences)
                  ultimoid++; //incrementa 
//assegna all'ID il valore incrementato rispetto l'ultimo

                // Aggiorna e salva in memoria il nuovo ultimo ID
                final prefs = await SharedPreferences.getInstance();
                await prefs.setInt("ultimoId", ultimoid);
                }

                var cliente=datiCliente(
                nome: nomeController.text,
                cognome: cognomeController.text,
                dataNascita: dataNascitaController.text,
                cf: cfController.text,
                telefono: telefonoController.text,
                email: emailController.text,
                via: viaController.text,
                cap: capController.text,
                citta: cittaController.text,
                registrazione: registrazioneController.text,
                provincia: provinciaController.text,
                note: noteController.text,
                id:ultimoid);
                Navigator.pop(context,cliente); //manda i dati indietro alla HomePage
              },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white), 
                child: 
                  Text("SALVA"),),

                SizedBox(width: 90.0),

              ElevatedButton(onPressed: (){ 
                //setState() segnala a Flutter che la UI deve ricostruirsi.Quando il controller viene svuotato, Flutter ridisegna i TextFormField e li mostra vuoti.
                setState(() {
                  cancellaCampi();
                }
              );
            },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white), 
                child: 
                  Text("CANCELLA"),),
            ],
          ),
        ),
      ),  
        
      

      body: Form(
        child: 
        SingleChildScrollView(
          child: Column(
            children: [ 
              Text("PERSONA"),
              TextFormField(controller:nomeController,decoration: InputDecoration(labelText: "Nome: ",prefixText: "")),
              TextFormField(controller:cognomeController,decoration: InputDecoration(labelText: "Cognome: ",prefixText: "")),
              TextFormField(controller:dataNascitaController,decoration: InputDecoration(labelText: "Data di nascita: ",prefixText: "")),
              TextFormField(controller:cfController,decoration: InputDecoration(labelText: "C.F.: ",prefixText: "")),
              Text("CONTATTI"),
              TextFormField(controller:telefonoController,decoration: InputDecoration(labelText: "Telefono: ",prefixText: "")),
              TextFormField(controller:emailController,decoration: InputDecoration(labelText: "E-mail: ",prefixText: "")),
              Text("INDIRIZZO"),
              TextFormField(controller:viaController,decoration: InputDecoration(labelText: "Via e numero civico: ",prefixText: "")),
              TextFormField(controller:capController,decoration: InputDecoration(labelText: "CAP: ",prefixText: "")),
              TextFormField(controller:cittaController,decoration: InputDecoration(labelText: "Città: ",prefixText: "")),
              TextFormField(controller:provinciaController,decoration: InputDecoration(labelText: "Provincia: ",prefixText: "")),
              Text("PER LO STUDIO"),
              TextFormField(controller:registrazioneController,decoration: InputDecoration(labelText: "Data registrazione: ",prefixText: "")),
              TextFormField(minLines: null, controller: noteController, decoration: InputDecoration(labelText: "Note: ",prefixText: "")),
            ],
          ),
        )
      )
    );
  }
}

//FLUSSO CONCETTUALE DEL TASTO CANCELLA:->
//L’utente digita nei campi, il testo viene memorizzato nei controller. L’utente preme “CANCELLA”. ->
//La funzione cancellaCampi() chiama .clear() su tutti i controller e tutti i campi diventano vuoti. ->
//setState() fa aggiornare la UI("ridisegna lo schermo"), i TextFormField vengono ridisegnati vuoti. ->
//Quando la pagina viene chiusa, dispose() libera tutti i controller dalla memoria. Quindi:->
//Controller=memoria viva del testo. Clear=cancella quel testo. SetState=aggiorna lo schermo. Dispose=pulisce la memoria dei controller.

//FLUSSO CONCETTUALE DEL TASTO SALVA:->
//Ho creato la classe datiCliente dove non ho inizializzato i dati.->
//Nella funzione onPressed di salva ho creato la variabile cliente e come parametri ho usufruito del->
//controller(funge da memorizzatore del testo scritto sulla app) con .text. Nella stessa->
//funzione aggiungo Navigator.pop in modo che quando clicco salva si chiude la schermata nuovoCliente.->
//Poi in HomePage creo una lista che conterrà tutti gli oggetti datiCliente che ricevera da nuovoCliente.->
//modifico la funzione nel floating introducendo async(si usa quando una funzione si concludera tardi)->
//ed await (serve a dire aspetta finche non finisco, poi vai avanti). Poi la funzione if dicendo->
// se lo stato non e nullo aggiungi alla lista clienti qualcosa di nuovo.