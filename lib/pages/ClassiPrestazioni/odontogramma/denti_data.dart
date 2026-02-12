// Dati di tutti i 32 denti secondo la numerazione FDI (Fédération Dentaire Internationale)

class DenteInfo {
  final String numero;
  final String nome;

  const DenteInfo({
    required this.numero,
    required this.nome,
  });
}

class DentiData {
  // Lista completa dei 32 denti permanenti
  static const List<DenteInfo> tuttiIDenti = [
    // 🦷 Arcata SUPERIORE - DESTRA (Quadrante 1)
    DenteInfo(numero: "18", nome: "Terzo Molare Superiore DX"),
    DenteInfo(numero: "17", nome: "Secondo Molare Superiore DX"),
    DenteInfo(numero: "16", nome: "Primo Molare Superiore DX"),
    DenteInfo(numero: "15", nome: "Secondo Premolare Superiore DX"),
    DenteInfo(numero: "14", nome: "Primo Premolare Superiore DX"),
    DenteInfo(numero: "13", nome: "Canino Superiore DX"),
    DenteInfo(numero: "12", nome: "Incisivo Laterale Superiore DX"),
    DenteInfo(numero: "11", nome: "Incisivo Centrale Superiore DX"),
    
    // 🦷 Arcata SUPERIORE - SINISTRA (Quadrante 2)
    DenteInfo(numero: "21", nome: "Incisivo Centrale Superiore SX"),
    DenteInfo(numero: "22", nome: "Incisivo Laterale Superiore SX"),
    DenteInfo(numero: "23", nome: "Canino Superiore SX"),
    DenteInfo(numero: "24", nome: "Primo Premolare Superiore SX"),
    DenteInfo(numero: "25", nome: "Secondo Premolare Superiore SX"),
    DenteInfo(numero: "26", nome: "Primo Molare Superiore SX"),
    DenteInfo(numero: "27", nome: "Secondo Molare Superiore SX"),
    DenteInfo(numero: "28", nome: "Terzo Molare Superiore SX"),
    
    // 🦷 Arcata INFERIORE - SINISTRA (Quadrante 3)
    DenteInfo(numero: "38", nome: "Terzo Molare Inferiore SX"),
    DenteInfo(numero: "37", nome: "Secondo Molare Inferiore SX"),
    DenteInfo(numero: "36", nome: "Primo Molare Inferiore SX"),
    DenteInfo(numero: "35", nome: "Secondo Premolare Inferiore SX"),
    DenteInfo(numero: "34", nome: "Primo Premolare Inferiore SX"),
    DenteInfo(numero: "33", nome: "Canino Inferiore SX"),
    DenteInfo(numero: "32", nome: "Incisivo Laterale Inferiore SX"),
    DenteInfo(numero: "31", nome: "Incisivo Centrale Inferiore SX"),
    
    // 🦷 Arcata INFERIORE - DESTRA (Quadrante 4)
    DenteInfo(numero: "41", nome: "Incisivo Centrale Inferiore DX"),
    DenteInfo(numero: "42", nome: "Incisivo Laterale Inferiore DX"),
    DenteInfo(numero: "43", nome: "Canino Inferiore DX"),
    DenteInfo(numero: "44", nome: "Primo Premolare Inferiore DX"),
    DenteInfo(numero: "45", nome: "Secondo Premolare Inferiore DX"),
    DenteInfo(numero: "46", nome: "Primo Molare Inferiore DX"),
    DenteInfo(numero: "47", nome: "Secondo Molare Inferiore DX"),
    DenteInfo(numero: "48", nome: "Terzo Molare Inferiore DX"),
  ];

  // Funzione per trovare un dente per numero
  static DenteInfo? trovaDente(String numero) {
    try {
      return tuttiIDenti.firstWhere((dente) => dente.numero == numero);
    } catch (e) {
      return null;
    }
  }

  // Funzione per ottenere tutti i denti di un quadrante
  static List<DenteInfo> dentiQuadrante(int quadrante) {
    return tuttiIDenti.where((dente) => dente.numero.startsWith(quadrante.toString())).toList();
  }
}
