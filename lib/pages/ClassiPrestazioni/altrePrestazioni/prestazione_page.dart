import 'dart:convert';
import 'package:esercizi/pages/datiCliente.dart';
import 'package:esercizi/services/SalvaInCartellaClinica.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

/// Classe generica per gestire qualsiasi tipo di prestazione
/// (Igiene, Visita, Radiografia, ecc.)
class PrestazionePage extends StatefulWidget {
  final String tipoPrestazione;  // es. "Igiene Dentale", "Visita", "Radiografia"
  
  const PrestazionePage({
    super.key,
    required this.tipoPrestazione,
  });

  @override
  State<PrestazionePage> createState() => _PrestazionePageState();
}

class _PrestazionePageState extends State<PrestazionePage> {

  List<datiCliente> clienti = []; //Carica tutta la lista clienti
  List<datiCliente> clientiFiltrati = []; //lista dei clienti che vengono man mano filtrati
  datiCliente? clienteSelezionato; //variabile per onTap (selezionare cliente)
  String notaDigitata = "";
  
  //variabili per selezionare la data della prestazione
  int? giornoSelezionato;
  int? meseSelezionato;
  int? annoSelezionato;

  //variabile x selezionare tipologia prestazione specifica (opzionale)
  String? sottotipoSelezionato;
  List<String> sottotipi = [];

  @override
  void initState() {
    super.initState();
    _caricaClienti();
    _inizializzaSottotipi();
  }

  // Inizializza i sottotipi in base al tipo di prestazione
  void _inizializzaSottotipi() {
    switch (widget.tipoPrestazione) {
      case "Igiene Dentale":
        sottotipi = ["Detartrasi", "Ablazione tartaro", "Lucidatura", "Fluoroprofilassi"];
        break;
      case "Visita":
        sottotipi = ["Prima visita", "Visita di controllo", "Visita urgenza", "Consulto"];
        break;
      case "Radiografia":
        sottotipi = ["Panoramica", "Endorale", "TC Cone Beam", "Teleradiografia"];
        break;
      default:
        sottotipi = []; // Nessun sottotipo
    }
  }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.tipoPrestazione),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(prefixIcon: Icon(Icons.search)),
            onChanged: (value) {
              setState(() {
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
                          ))
                      .toList(),
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

          // DROPDOWN SOTTOTIPO (se ci sono sottotipi disponibili)
          if (sottotipi.isNotEmpty)
            DropdownButton<String>(
              hint: Text("Seleziona tipologia"),
              value: sottotipoSelezionato,
              items: sottotipi.map((tipo) {
                return DropdownMenuItem(
                  value: tipo,
                  child: Text(tipo),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  sottotipoSelezionato = value;
                });
              },
            ),

          // CAMPO NOTE (visibile solo se un cliente è selezionato)
          if (clienteSelezionato != null)
            Padding(
              padding: EdgeInsets.all(12),
              child: Container(
                height: 200,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: SingleChildScrollView(
                  child: TextField(
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    onChanged: (value) {
                      notaDigitata = value;
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
                  onTap: () {
                    setState(() {
                      clienteSelezionato = clientiFiltrati[index];
                      clientiFiltrati.clear();
                    });
                  },
                );
              },
            ),
          ),

          //BOTTONE SALVA
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: ElevatedButton(
              onPressed: () async {
                // Costruisce la tipologia completa
                String tipologiaCompleta = widget.tipoPrestazione;
                if (sottotipoSelezionato != null) {
                  tipologiaCompleta += " - $sottotipoSelezionato";
                }

                await SalvaInCartellaClinica.salvaPrestazione(
                  idPaziente: clienteSelezionato!.id.toString(),
                  nome: clienteSelezionato!.nome,
                  cognome: clienteSelezionato!.cognome,
                  data: "${giornoSelezionato!}/${meseSelezionato!}/${annoSelezionato!}",
                  tipoPrestazione: tipologiaCompleta,
                  dente: "N/A", // Non applicabile per prestazioni generali
                  note: notaDigitata,
                );
                
                // 🔙 Torna indietro automaticamente dopo il salvataggio
                if (mounted) {
                  Navigator.pop(context);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
              child: Text("SALVA"),
            ),
          ),
        ],
      ),
    );
  }

  void _caricaClienti() async {
    final prefs = await SharedPreferences.getInstance();
    final listaJson = prefs.getStringList("clienti");

    if (listaJson == null) {
      setState(() {
        clienti = [];
        clientiFiltrati = [];
      });
      return;
    }

    List<datiCliente> listaDecodificata = [];

    for (var jsonString in listaJson) {
      try {
        final map = jsonDecode(jsonString);
        listaDecodificata.add(datiCliente.fromJson(map));
      } catch (e) {
        continue;
      }
    }

    if (!mounted) return;

    setState(() {
      clienti = listaDecodificata;
      clientiFiltrati = [];
    });
  }
}
