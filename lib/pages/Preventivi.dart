import 'dart:convert';
import 'package:esercizi/pages/datiCliente.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preventivi extends StatefulWidget {
  @override
  State<Preventivi> createState() => _Preventivi();
}

class _Preventivi extends State<Preventivi> {
  // Mappa dei pazienti con preventivi
  Map<String, Map<String, String>> pazientiConPreventivi = {};

  @override
  void initState() {
    super.initState();
    _caricaPazienti();
  }

  // Carica tutti i pazienti che hanno almeno un preventivo
  Future<void> _caricaPazienti() async {
    final prefs = await SharedPreferences.getInstance();
    final keys = prefs.getKeys();

    Map<String, Map<String, String>> risultati = {};

    for (String k in keys) {
      if (k.startsWith("preventivi_")) {
        String id = k.replaceFirst("preventivi_", "");
        List<String>? lista = prefs.getStringList(k);

        if (lista != null && lista.isNotEmpty) {
          Map<String, dynamic> p = jsonDecode(lista.first);
          risultati[id] = {
            "nome": p["nome"],
            "cognome": p["cognome"],
          };
        }
      }
    }

    setState(() {
      pazientiConPreventivi = risultati;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Preventivi"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      
      // Pulsante per creare nuovo preventivo
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => NuovoPreventivo()),
          ).then((_) => _caricaPazienti());
        },
        backgroundColor: Colors.blue,
        child: Icon(Icons.add, color: Colors.white),
      ),

      body: pazientiConPreventivi.isEmpty
          ? Center(
              child: Text(
                "Nessun preventivo salvato\n\nPremi + per crearne uno",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: pazientiConPreventivi.length,
              itemBuilder: (context, index) {
                String id = pazientiConPreventivi.keys.elementAt(index);
                String nome = pazientiConPreventivi[id]!["nome"]!;
                String cognome = pazientiConPreventivi[id]!["cognome"]!;

                return ListTile(
                  title: Text("$nome $cognome"),
                  subtitle: Text("ID paziente: $id"),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => PreventiviPaziente(
                          idPaziente: id,
                          nome: nome,
                          cognome: cognome,
                        ),
                      ),
                    ).then((_) => _caricaPazienti());
                  },
                );
              },
            ),
    );
  }
}

// ====================================================================
// PAGINA PER CREARE UN NUOVO PREVENTIVO
// ====================================================================

class NuovoPreventivo extends StatefulWidget {
  @override
  State<NuovoPreventivo> createState() => _NuovoPreventivoState();
}

class _NuovoPreventivoState extends State<NuovoPreventivo> {
  List<datiCliente> clienti = [];
  List<datiCliente> clientiFiltrati = [];
  datiCliente? clienteSelezionato;

  // Variabili per la data
  int? giornoSelezionato;
  int? meseSelezionato;
  int? annoSelezionato;

  // Variabili per il preventivo
  TextEditingController descrizioneController = TextEditingController();
  TextEditingController importoTotaleController = TextEditingController();
  TextEditingController importoPagatoController = TextEditingController();
  TextEditingController noteController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _caricaClienti();
  }

  Future<void> _caricaClienti() async {
    final prefs = await SharedPreferences.getInstance();
    final listaJson = prefs.getStringList("clienti");

    if (listaJson == null) {
      setState(() {
        clienti = [];
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
    });
  }

  Future<void> _salvaPreventivo() async {
    // Validazione
    if (clienteSelezionato == null) {
      _mostraErrore("Seleziona un cliente");
      return;
    }
    if (giornoSelezionato == null || meseSelezionato == null || annoSelezionato == null) {
      _mostraErrore("Seleziona una data");
      return;
    }
    if (descrizioneController.text.isEmpty) {
      _mostraErrore("Inserisci una descrizione");
      return;
    }
    if (importoTotaleController.text.isEmpty) {
      _mostraErrore("Inserisci l'importo totale");
      return;
    }

    double importoTotale = double.tryParse(importoTotaleController.text) ?? 0;
    double importoPagato = double.tryParse(importoPagatoController.text) ?? 0;

    if (importoTotale <= 0) {
      _mostraErrore("L'importo totale deve essere maggiore di zero");
      return;
    }

    if (importoPagato > importoTotale) {
      _mostraErrore("L'importo pagato non può superare il totale");
      return;
    }

    // Salva il preventivo
    final prefs = await SharedPreferences.getInstance();
    final String key = 'preventivi_${clienteSelezionato!.id}';
    List<String> preventiviSalvati = prefs.getStringList(key) ?? [];

    double importoResiduo = importoTotale - importoPagato;
    String idPreventivo = DateTime.now().millisecondsSinceEpoch.toString();

    final Map<String, dynamic> nuovoPreventivo = {
      'id': idPreventivo,
      'nome': clienteSelezionato!.nome,
      'cognome': clienteSelezionato!.cognome,
      'data': "$giornoSelezionato/$meseSelezionato/$annoSelezionato",
      'descrizione': descrizioneController.text,
      'importoTotale': importoTotale,
      'importoPagato': importoPagato,
      'importoResiduo': importoResiduo,
      'note': noteController.text,
      'dataCreazione': DateTime.now().toIso8601String(),
    };

    preventiviSalvati.insert(0, jsonEncode(nuovoPreventivo));
    await prefs.setStringList(key, preventiviSalvati);

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Preventivo salvato con successo"),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.pop(context);
    }
  }

  void _mostraErrore(String messaggio) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(messaggio), backgroundColor: Colors.red),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nuovo Preventivo"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // RICERCA CLIENTE
            TextField(
              decoration: InputDecoration(
                labelText: "Cerca cliente",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  clientiFiltrati = clienti.where((cliente) {
                    final nomeCompleto = "${cliente.nome} ${cliente.cognome}";
                    return nomeCompleto.toLowerCase().contains(value.toLowerCase());
                  }).toList();
                });
              },
            ),

            SizedBox(height: 10),

            // CLIENTE SELEZIONATO
            if (clienteSelezionato != null)
              Card(
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${clienteSelezionato!.nome} ${clienteSelezionato!.cognome}",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Text("CF: ${clienteSelezionato!.cf}"),
                      Text("ID: ${clienteSelezionato!.id}"),
                    ],
                  ),
                ),
              ),

            // LISTA CLIENTI FILTRATI
            if (clientiFiltrati.isNotEmpty)
              Container(
                height: 150,
                child: ListView.builder(
                  itemCount: clientiFiltrati.length,
                  itemBuilder: (context, index) {
                    final cliente = clientiFiltrati[index];
                    return ListTile(
                      title: Text("${cliente.nome} ${cliente.cognome}"),
                      subtitle: Text(cliente.cf),
                      onTap: () {
                        setState(() {
                          clienteSelezionato = cliente;
                          clientiFiltrati.clear();
                        });
                      },
                    );
                  },
                ),
              ),

            SizedBox(height: 20),

            // SELEZIONE DATA
            Text("Data preventivo:", style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DropdownButton<int>(
                  value: giornoSelezionato,
                  hint: Text("Giorno"),
                  items: List.generate(31, (i) => i + 1)
                      .map((g) => DropdownMenuItem(value: g, child: Text("$g")))
                      .toList(),
                  onChanged: (val) => setState(() => giornoSelezionato = val),
                ),
                DropdownButton<int>(
                  value: meseSelezionato,
                  hint: Text("Mese"),
                  items: List.generate(12, (i) => i + 1)
                      .map((m) => DropdownMenuItem(value: m, child: Text("$m")))
                      .toList(),
                  onChanged: (val) => setState(() => meseSelezionato = val),
                ),
                DropdownButton<int>(
                  value: annoSelezionato,
                  hint: Text("Anno"),
                  items: List.generate(151, (i) => 1900 + i)
                      .map((a) => DropdownMenuItem(value: a, child: Text("$a")))
                      .toList(),
                  onChanged: (val) => setState(() => annoSelezionato = val),
                ),
              ],
            ),

            SizedBox(height: 20),

            // DESCRIZIONE
            TextField(
              controller: descrizioneController,
              decoration: InputDecoration(
                labelText: "Descrizione prestazione",
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),

            SizedBox(height: 16),

            // IMPORTO TOTALE
            TextField(
              controller: importoTotaleController,
              decoration: InputDecoration(
                labelText: "Importo totale (€)",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.euro),
              ),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
              ],
            ),

            SizedBox(height: 16),

            // IMPORTO PAGATO
            TextField(
              controller: importoPagatoController,
              decoration: InputDecoration(
                labelText: "Importo già pagato (€)",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.euro),
                hintText: "0.00",
              ),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
              ],
            ),

            SizedBox(height: 16),

            // NOTE
            TextField(
              controller: noteController,
              decoration: InputDecoration(
                labelText: "Note (opzionale)",
                border: OutlineInputBorder(),
              ),
              maxLines: 4,
            ),

            SizedBox(height: 30),

            // BOTTONE SALVA
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _salvaPreventivo,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
                child: Text("SALVA PREVENTIVO", style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ====================================================================
// PAGINA CHE MOSTRA TUTTI I PREVENTIVI DI UN PAZIENTE
// ====================================================================

class PreventiviPaziente extends StatefulWidget {
  final String idPaziente;
  final String nome;
  final String cognome;

  const PreventiviPaziente({
    super.key,
    required this.idPaziente,
    required this.nome,
    required this.cognome,
  });

  @override
  State<PreventiviPaziente> createState() => _PreventiviPazienteState();
}

class _PreventiviPazienteState extends State<PreventiviPaziente> {
  List<Map<String, dynamic>> preventivi = [];

  @override
  void initState() {
    super.initState();
    _caricaPreventivi();
  }

  Future<void> _caricaPreventivi() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'preventivi_${widget.idPaziente}';
    List<String>? listaJson = prefs.getStringList(key);

    if (listaJson != null) {
      setState(() {
        preventivi = listaJson.map((e) => jsonDecode(e) as Map<String, dynamic>).toList();
      });
    }
  }

  Future<void> _aggiungiPagamento(Map<String, dynamic> preventivo, int index) async {
    TextEditingController importoController = TextEditingController();

    bool? conferma = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Aggiungi pagamento"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Importo residuo: €${preventivo['importoResiduo'].toStringAsFixed(2)}"),
            SizedBox(height: 16),
            TextField(
              controller: importoController,
              decoration: InputDecoration(
                labelText: "Importo pagamento (€)",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
              ],
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text("ANNULLA"),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text("CONFERMA"),
          ),
        ],
      ),
    );

    if (conferma == true && importoController.text.isNotEmpty) {
      double importo = double.tryParse(importoController.text) ?? 0;
      
      if (importo <= 0 || importo > preventivo['importoResiduo']) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Importo non valido"), backgroundColor: Colors.red),
        );
        return;
      }

      // Aggiorna il preventivo
      setState(() {
        preventivi[index]['importoPagato'] += importo;
        preventivi[index]['importoResiduo'] -= importo;
      });

      // Salva in SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      final key = 'preventivi_${widget.idPaziente}';
      List<String> preventiviJson = preventivi.map((e) => jsonEncode(e)).toList();
      await prefs.setStringList(key, preventiviJson);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Pagamento registrato"), backgroundColor: Colors.green),
      );
    }
  }

  Future<void> _cancellaPreventivo(int index) async {
    bool? conferma = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Conferma cancellazione"),
        content: Text("Vuoi cancellare questo preventivo?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text("ANNULLA"),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: Text("CANCELLA"),
          ),
        ],
      ),
    );

    if (conferma == true) {
      setState(() {
        preventivi.removeAt(index);
      });

      final prefs = await SharedPreferences.getInstance();
      final key = 'preventivi_${widget.idPaziente}';

      if (preventivi.isEmpty) {
        await prefs.remove(key);
        Navigator.pop(context);
      } else {
        List<String> preventiviJson = preventivi.map((e) => jsonEncode(e)).toList();
        await prefs.setStringList(key, preventiviJson);
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Preventivo cancellato"), backgroundColor: Colors.green),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Preventivi - ${widget.nome} ${widget.cognome}"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: preventivi.isEmpty
          ? Center(child: Text("Nessun preventivo"))
          : ListView.builder(
              itemCount: preventivi.length,
              itemBuilder: (context, index) {
                final p = preventivi[index];
                bool saldato = p['importoResiduo'] <= 0;

                return Card(
                  margin: EdgeInsets.all(12),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              p['descrizione'],
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            IconButton(
                              icon: Icon(Icons.delete, color: Colors.red),
                              onPressed: () => _cancellaPreventivo(index),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Text("Data: ${p['data']}"),
                        SizedBox(height: 8),
                        Text(
                          "Totale: €${p['importoTotale'].toStringAsFixed(2)}",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text("Pagato: €${p['importoPagato'].toStringAsFixed(2)}"),
                        Text(
                          "Residuo: €${p['importoResiduo'].toStringAsFixed(2)}",
                          style: TextStyle(
                            color: saldato ? Colors.green : Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        if (p['note'].isNotEmpty) ...[
                          SizedBox(height: 8),
                          Text("Note: ${p['note']}", style: TextStyle(fontStyle: FontStyle.italic)),
                        ],
                        
                        if (!saldato) ...[
                          SizedBox(height: 12),
                          ElevatedButton.icon(
                            onPressed: () => _aggiungiPagamento(p, index),
                            icon: Icon(Icons.euro),
                            label: Text("Aggiungi pagamento"),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              foregroundColor: Colors.white,
                            ),
                          ),
                        ] else ...[
                          SizedBox(height: 12),
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.green[100],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.check_circle, color: Colors.green),
                                SizedBox(width: 8),
                                Text("SALDATO", style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
