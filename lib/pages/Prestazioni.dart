import 'package:esercizi/pages/ClassiPrestazioni/altrePrestazioni/Igiene.dart';
import 'package:esercizi/pages/ClassiPrestazioni/altrePrestazioni/Visita.dart';
import 'package:esercizi/pages/ClassiPrestazioni/odontogramma/denti_data.dart';
import 'package:esercizi/pages/ClassiPrestazioni/odontogramma/dente_page.dart';
import 'package:flutter/material.dart';

class Prestazioni extends StatefulWidget {
  @override
  State<Prestazioni> createState() => _Prestazioni();
}

class _Prestazioni extends State<Prestazioni> {
  
  // Mappa che associa il numero del dente al nome del file immagine
  final Map<String, String> immaginiDenti = {
    // Arcata Superiore - Destra
    "18": "terzo-molare-sup-dx.png",
    "17": "secondo-molare-sup-dx.png",
    "16": "primo-molare-sup-dx.png",
    "15": "secondo-premolare-sup-dx.png",
    "14": "primo-premolare-sup-dx.png",
    "13": "canino-sup-dx.png",
    "12": "incisivo-lat-sup-dx.png",
    "11": "incisivo-sup-dx.png",
    // Arcata Superiore - Sinistra
    "21": "incisivo-sup-sx.png",
    "22": "incisivo-lat-sup-sx.png",
    "23": "canino-sup-sx.png",
    "24": "primo-premolare-sup-sx.png",
    "25": "secondo-premolare-sup-sx.png",
    "26": "primo-molare-sup-sx.png",
    "27": "secondo-molare-sup-sx.png",
    "28": "terzo-molare-sup-sx.png",
    // Arcata Inferiore - Destra
    "48": "terzo-molare-inf-dx.png",
    "47": "secondo-molare-inf-dx.png",
    "46": "primo-molare-inf-dx.png",
    "45": "secondo-premolare-inf-dx.png",
    "44": "primo-premolare-inf-dx.png",
    "43": "canino-inf-dx.png",
    "42": "incisivo-lat-inf-dx.png",
    "41": "incisivo-inf-dx.png",
    // Arcata Inferiore - Sinistra
    "31": "incisivo-inf-sx.png",
    "32": "incisivo-lat-inf-sx.png",
    "33": "canino-inf-sx.png",
    "34": "primo-premolare-inf-sx.png",
    "35": "secondo-premolare-inf-sx.png",
    "36": "primo-molare-inf-sx.png",
    "37": "secondo-molare-inf-sx.png",
    "38": "terzo-molare-inf-sx.png",
  };

  // Funzione helper per creare un dente con tooltip e immagine
  Widget _buildDente(String numeroDente) {
    final dente = DentiData.trovaDente(numeroDente);
    final immagine = immaginiDenti[numeroDente];
    
    if (dente == null || immagine == null) return SizedBox();

    return Tooltip(
      message: "${dente.numero} - ${dente.nome}",
      waitDuration: Duration(milliseconds: 100),
      showDuration: Duration(milliseconds: 100),
      preferBelow: false,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DentePage(
                numeroDente: dente.numero,
                nomeDente: dente.nome,
              ),
            ),
          );
        },
        child: Image.asset("assets/$immagine"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Prestazioni"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Column(
        spacing: 25,
        children: [
          // PULSANTI VISITA E IGIENE
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 🦷 Visita 🦷
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Visita()),
                    );
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(132, 33, 149, 243),
                  foregroundColor: Colors.white,
                ),
                child: Text("Visita"),
              ),
              
              // 🦷 Igiene 🦷
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Igiene()),
                    );
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(132, 33, 149, 243),
                  foregroundColor: Colors.white,
                ),
                child: Text("Igiene Dentale"),
              ),
            ],
          ),

          // 🦷 ODONTOGRAMMA 🦷
          Text(
            "ODONTOGRAMMA:",
            style: TextStyle(color: Colors.blue, fontSize: 20),
          ),
          
          Column(
            children: [
              // ARCATA SUPERIORE
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Superiore Destra (18 → 11)
                  ...[for (var i = 18; i >= 11; i--) _buildDente(i.toString())],
                  // Superiore Sinistra (21 → 28)
                  ...[for (var i = 21; i <= 28; i++) _buildDente(i.toString())],
                ],
              ),
              
              // ARCATA INFERIORE
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Inferiore Destra (48 → 41)
                  ...[for (var i = 48; i >= 41; i--) _buildDente(i.toString())],
                  // Inferiore Sinistra (31 → 38)
                  ...[for (var i = 31; i <= 38; i++) _buildDente(i.toString())],
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
