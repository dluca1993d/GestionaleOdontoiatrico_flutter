import 'dart:convert';
import 'package:esercizi/pages/datiCliente.dart';
import 'package:esercizi/services/SalvaInCartellaClinica.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class DentePage extends StatefulWidget {
  final String numeroDente;  // es. "43"
  final String nomeDente;    // es. "Canino Inferiore DX"
  
  const DentePage({
    super.key,
    required this.numeroDente,
    required this.nomeDente,
  });

  @override
  State<DentePage> createState() => _DentePageState();
}

class _DentePageState extends State<DentePage> {

  List<datiCliente> clienti = []; //Carica tutta la lista clienti
  List<datiCliente> clientiFiltrati = []; //lista dei clienti che vengono man mano filtrati
  datiCliente? clienteSelezionato; //variabile per onTap (selezionare cliente)
  String notaDigitata = "";
  
  //variabili per selezionare la data della prestazione
  int? giornoSelezionato;
  int? meseSelezionato;
  int? annoSelezionato;

  //variabile x selezionare tipologia prestazione
  String? tipologiaSelezionata;
  List<String> tipoPrestazione = ["Carie", "Devitalizzazione", "Estrazione", "Ortodonzia", "Protesi", "Chirurgia"];

  @override
  void initState() {
    super.initState();
    _caricaClienti();
  }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.numeroDente} - ${widget.nomeDente}"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(prefixIcon: Icon(Icons.search)),
            onChanged: (value) {  //onChanged=funzione che si attiva ogni volta che si digia
              setState(() {  //Ridisegna la pag aggiornando la lista
                //clienti.where((cliente) { ... })= Prende la lista completa dei clienti e li scorre uno per uno.
                clientiFiltrati = clienti.where((cliente) {
                  final nomeCompleto = "${cliente.nome} ${cliente.cognome}";
                  return nomeCompleto.contains(value);
                }).toList();
              });
            },
          ),

          //LOGICA X FAR COMPARIRE I DATI DEL CLIENTE
          clienteSelezionato == null
              ? Text("Digita cliente")
              : Card(
                  margin: EdgeInsets.all(12),
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${clienteSelezionato!.nome} ${clienteSelezionato!.cognome}"),
                        SizedBox(height: 6),
                        Text("Nato: ${clienteSelezionato!.dataNascita}"),
                        SizedBox(height: 6),
                        Text("CF: ${clienteSelezionato!.cf}"),
                        SizedBox(height: 6),
                        Text("ID: ${clienteSelezionato!.id}"),
                      ],
                    ),
                  ),
                ),

//PER SELEZIONE DATA
            Padding(
            padding: EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Giorno
                DropdownButton<int>(
                  value: giornoSelezionato,
                  hint: Text("Giorno"),
                  items: List.generate(31, (index) => index + 1)
                      .map((giorno) => DropdownMenuItem<int>(
                            value: giorno,
                            child: Text(giorno.toString()),
                          )).toList(),
                  onChanged: (val) {
                    setState(() {
                      giornoSelezionato = val!;
                    });
                  },
                ),

      // Mese
              DropdownButton<int>(
                value: meseSelezionato,
                hint: Text("Mese"),
                items: List.generate(12, (index) => index + 1)
                    .map((mese) => DropdownMenuItem<int>(
                          value: mese,
                          child: Text(mese.toString()),
                        ))
                    .toList(),
                onChanged: (val) {
                  setState(() {
                    meseSelezionato = val!;
                  });
                },
              ),

      // Anno
            DropdownButton<int>(
              value: annoSelezionato,
              hint: Text("Anno"),
              items: List.generate(2050 - 1900 + 1, (index) => 1900 + index)
                  .map((anno) => DropdownMenuItem<int>(
                        value: anno,
                        child: Text(anno.toString()),
                      ))
                  .toList(),
              onChanged: (val) {
                setState(() {
                  annoSelezionato = val!;
                });
              },
            ),
          ],
        ),
      ),

              

DropdownButton<String>(
  hint: Text("Seleziona tipologia"),
  value: tipologiaSelezionata,
  items: tipoPrestazione.map((tipo) {
    return DropdownMenuItem(
      value: tipo,
      child: Text(tipo),
    );
  }).toList(),
  onChanged: (value) {
    setState(() {
      tipologiaSelezionata = value; // si precompila il dropdown con la voce cliccata
    });
  },
),




          // CAMPO NOTE (visibile solo se un cliente è selezionato)
          if (clienteSelezionato != null)
            Padding(
              padding: EdgeInsets.all(12),
              child: Container(
                height: 200, // altezza fissa, il contenuto interno scrolla
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: SingleChildScrollView(
                  child: TextField(
                    maxLines: null, // multilinea infinita
                    keyboardType: TextInputType.multiline,
                    onChanged: (value) {
                      notaDigitata = value; // aggiorna la variabile mentre digito
                    },
                    decoration: InputDecoration(
                      hintText: "Scrivi una nota...",
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),

          Expanded(
            child: ListView.builder(
              itemCount: clientiFiltrati.length,
              itemBuilder: (context, index) {
                final cliente = clientiFiltrati[index];
                return ListTile(
                  title: Text("${cliente.nome} ${cliente.cognome}"),
                  subtitle: Text("${cliente.dataNascita} ${cliente.cf}"),
                  //SELEZIONO IL CLIENTE E SI CANCELLA LA LISTA DEI FILTRATI
                  onTap: () {
                    setState(() {
                      clienteSelezionato = clientiFiltrati[index]; //salvo il cliente che ho filtrato e selezionato
                      clientiFiltrati.clear(); //pulisco la lista che mi esce quando filtro, appena dopo il tap
                    });
                  },
                );
              },
            ),
          ),

          
    //BOTTONE SALVA CON FUNZIONE
         Padding(
           padding: const EdgeInsets.all(50.0),
           child: ElevatedButton(
             onPressed: ()async{
              await SalvaInCartellaClinica.salvaPrestazione(
                idPaziente: clienteSelezionato!.id.toString(),
                nome: clienteSelezionato!.nome,
                cognome: clienteSelezionato!.cognome,
                data: "${giornoSelezionato!}/${meseSelezionato!}/${annoSelezionato!}",
                tipoPrestazione: tipologiaSelezionata!,
                dente: widget.nomeDente,  // 🎯 Usa il nome del dente passato come parametro
                note: notaDigitata,
                );
             }, 
             
             style: ElevatedButton.styleFrom(
                     backgroundColor: Colors.blue,
                     foregroundColor: Colors.white), 
                     child: 
                       Text("SALVA")),
                      ), 
                      // 


        ],
      ),
    );
  }

  void _caricaClienti() async {
    final prefs = await SharedPreferences.getInstance();

    // Legge la lista salvata (lista di stringhe JSON)
    final listaJson = prefs.getStringList("clienti");

    // Se non esiste ancora la chiave
    if (listaJson == null) {
      setState(() {
        clienti = [];
        clientiFiltrati = [];
      });
      return;
    }

    // Decodifica: da JSON-> datiCliente
    List<datiCliente> listaDecodificata = [];

    for (var jsonString in listaJson) {
      try { //uso un loop con try/catch per ignorare eventuali JSON malformati.
        final map = jsonDecode(jsonString); //converte la stringa JSON in una mappa
        listaDecodificata.add(datiCliente.fromJson(map));
      } catch (e) {
        // JSON malformato-> viene saltato
        continue;
      }
    }

    // Aggiorna la UI SOLO se il widget è ancora attivo
    if (!mounted) return; //controlla se lo State è ancora montato nel widget tree.

    setState(() {
      clienti = listaDecodificata; // lista completa
      clientiFiltrati = []; // parte vuota finché non si digita
    });
  }
}
