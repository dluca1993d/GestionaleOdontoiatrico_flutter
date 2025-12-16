import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartellaClinica extends StatefulWidget {
  @override
  State<CartellaClinica> createState() => _CartellaClinicaState();
}


class _CartellaClinicaState extends State<CartellaClinica> {

  /*
    Questa mappa serve per costruire l’elenco dei pazienti da mostrare a schermo.

    Struttura:
    {
      "1": {"nome": "Luca", "cognome": "Rossi"},
      "2": {"nome": "Mario", "cognome": "Verdi"}
    }

    - la chiave esterna è l'ID del paziente
    - la mappa interna contiene solo nome e cognome

    NOTA:
    qui NON salvo le prestazioni, ma solo i dati minimi
    per mostrare la lista dei pazienti.
  */
  Map<String, Map<String, String>> pazienti = {};



  /*
    initState viene eseguito UNA SOLA VOLTA,
    quando la pagina viene creata.

    Cosa fa: carica dati, fa letture da memoria, inizializza lo stato
  */
  @override
  void initState() {
    super.initState();
    _caricaPazienti();
  }



  /*
    Questa funzione:
    - legge TUTTE le chiavi salvate in SharedPreferences
    - prende solo quelle che iniziano con "prestazioni_"
    - da lì ricava l’elenco dei pazienti che hanno almeno
      una prestazione salvata
  */
  Future<void> _caricaPazienti() async {
    // qui ottengo l'istanza di SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    // Recupero tutte le chiavi salvate
    final keys = prefs.getKeys();


    /*
      Mappa temporanea:
      la costruisco passo passo mentre si analizzano i dati salvati.

      Alla fine verrà assegnata alla variabile "pazienti"
      con setState().
    */
    Map<String, Map<String, String>> risultati = {};


    /*
      Cicliamo su TUTTE le chiavi presenti in SharedPreferences.
      Esempio di chiavi:
      - clienti
      - prestazioni_1, prestazioni_5 ecc..
    */
    for (String k in keys) {
      // Considero solo le chiavi che rappresentano prestazioni
      if (k.startsWith("prestazioni_")) {

        // Estraggo l'id del paziente dalla chiave
        // es: "prestazioni_3" -> "3"
        String id = k.replaceFirst("prestazioni_", "");

        // Recupero la lista di prestazioni di quel paziente
        List<String>? lista = prefs.getStringList(k);


        /*
          Controllo che:
          - la lista esista
          - non sia vuota

          Se è vuota significa che non ci sono prestazioni valide
        */
        if (lista != null && lista.isNotEmpty) {

          /*
            Decodifico la PRIMA prestazione.
            Lo facciamo solo per leggere nome e cognome del paziente.

            Non importa quale prestazione prendo,
            perché nome e cognome sono uguali per tutte.
          */
          Map<String, dynamic> p = jsonDecode(lista.first);

          // Inserisco il paziente nella mappa risultati
          risultati[id] = {
            "nome": p["nome"],
            "cognome": p["cognome"],
          };
        }
      }
    }

    /*
      Aggiorna lo stato della pagina.
      Questo forza il sistema a ridisegnare l’interfaccia usando i nuovi dati caricati.
    */
    setState(() {
      pazienti = risultati;
    });
  }



  /*
    build costruisce l’interfaccia grafica.
    Viene richiamato ogni volta che cambia lo stato.
  */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cartella Clinica"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),

      /*
        Se NON ci sono pazienti con prestazioni:
        mostra un messaggio.

        Altrimenti:
        mostra una lista scrollabile di pazienti.
      */
      body: pazienti.isEmpty
          ? Center(
              child: Text(
                "Nessuna prestazione salvata",
                style: TextStyle(fontSize: 20),
              ),
            )
          : ListView.builder(
              itemCount: pazienti.length,
              itemBuilder: (context, index) {

                // Recupera id, nome e cognome del paziente
                String id = pazienti.keys.elementAt(index);
                String nome = pazienti[id]!["nome"]!;
                String cognome = pazienti[id]!["cognome"]!;

                // Ogni paziente viene mostrato come una riga cliccabile
                return ListTile(
                  title: Text("$nome $cognome"),
                  subtitle: Text("ID paziente: $id"),
                  trailing: Icon(Icons.arrow_forward_ios),

                  /*
                    Quando clicco un paziente:
                    si va alla pagina delle sue prestazioni.
                  */
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            PrestazioniPaziente(idPaziente: id),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}




//Questa è la pagina che mostrerà le prestazioni di un singolo paziente.

class PrestazioniPaziente extends StatefulWidget {
  final String idPaziente;

  const PrestazioniPaziente({super.key, required this.idPaziente});

  @override
  State<PrestazioniPaziente> createState() => _PrestazioniPazienteState();
}

class _PrestazioniPazienteState extends State<PrestazioniPaziente> {
  // Lista delle prestazioni del paziente
  List<Map<String, dynamic>> prestazioni = [];

  @override
  void initState() {
    super.initState();
    _caricaPrestazioni();
  }

  // Carica le prestazioni dal SharedPreferences
  Future<void> _caricaPrestazioni() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'prestazioni_${widget.idPaziente}';

    List<String>? listaJson = prefs.getStringList(key);

    if (listaJson != null) {
      setState(() {
        prestazioni = listaJson
            .map((e) => jsonDecode(e) as Map<String, dynamic>)
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Prestazioni paziente"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: prestazioni.isEmpty
          ? Center(
              child: Text(
                "Nessuna prestazione registrata",
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: prestazioni.length,
              itemBuilder: (context, index) {
                final p = prestazioni[index];

                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  child: ListTile(
                    title: Text(
                      "${p['data']} - ${p['tipoPrestazione']}",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text("Dente: ${p['dente']}"),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // QUI in futuro aprirai il dettaglio completo
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: Text("Dettaglio prestazione"),
                          content: Text(
                            "Data: ${p['data']}\n"
                            "Tipo: ${p['tipoPrestazione']}\n"
                            "Dente: ${p['dente']}\n\n"
                            "Note:\n${p['note']}",
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}
