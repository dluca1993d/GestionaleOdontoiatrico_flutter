//per salvare uso SHAREDPREFERENCES

import 'dart:convert'; // per jsonEncode
import 'package:shared_preferences/shared_preferences.dart';

class SalvaInCartellaClinica {

// Metodo statico: posso richiamarlo senza creare un'istanza
  static Future<void> salvaPrestazione({
    required String idPaziente,
    required String nome,
    required String cognome,
    required String data,
    required String tipoPrestazione,
    required String dente,
    required String note,
  }) async {
    final prefs = await SharedPreferences.getInstance();

    // Chiave unica per il paziente
    final String key = 'prestazioni_$idPaziente';

    // Recupera la lista esistente di prestazioni (o crea lista vuota se non esiste)
    List<String> prestazioniSalvate = prefs.getStringList(key) ?? [];

    // Crea la nuova prestazione come mappa
    final Map<String, String> nuovaPrestazione = {
      'nome': nome,
      'cognome': cognome,
      'data': data,
      'tipoPrestazione': tipoPrestazione,
      'dente': dente,
      'note': note,
    };

    // Aggiunge la nuova prestazione in cima alla lista (prima la piu recente)
    prestazioniSalvate.insert(0, jsonEncode(nuovaPrestazione));

    // Salva di nuovo la lista aggiornata in SharedPreferences
    await prefs.setStringList(key, prestazioniSalvate);
  }
}
