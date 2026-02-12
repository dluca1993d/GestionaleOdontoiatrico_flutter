import 'package:flutter/material.dart';
import 'dente_page.dart';
import 'denti_data.dart';

// Esempio di come usare la nuova DentePage
// Invece di avere 32 classi separate, ora usi una sola classe parametrizzata!

class OdontogrammaPage extends StatelessWidget {
  const OdontogrammaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Odontogramma"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, // 4 denti per riga
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 1.5,
        ),
        itemCount: DentiData.tuttiIDenti.length,
        itemBuilder: (context, index) {
          final dente = DentiData.tuttiIDenti[index];
          
          return ElevatedButton(
            onPressed: () {
              // 🎯 QUESTO È IL PUNTO CHIAVE!
              // Invece di navigare a 32 classi diverse, navighi sempre alla stessa
              // passando solo i parametri diversi
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
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue[100],
              foregroundColor: Colors.black87,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  dente.numero,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  dente.nome.split(' ')[0], // Solo la prima parola (tipo di dente)
                  style: TextStyle(fontSize: 10),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// OPPURE se vuoi un layout più realistico tipo schema dentale:
class OdontogrammaSchemaPage extends StatelessWidget {
  const OdontogrammaSchemaPage({super.key});

  Widget _buildDenteButton(BuildContext context, String numero) {
    final dente = DentiData.trovaDente(numero);
    if (dente == null) return SizedBox();

    return GestureDetector(
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
      child: Container(
        margin: EdgeInsets.all(4),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.blue, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          dente.numero,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Schema Odontogramma"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Arcata superiore
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Superiore DX
              ...[for (var i = 18; i >= 11; i--) _buildDenteButton(context, i.toString())],
              SizedBox(width: 20), // Spazio centrale
              // Superiore SX
              ...[for (var i = 21; i <= 28; i++) _buildDenteButton(context, i.toString())],
            ],
          ),
          
          SizedBox(height: 40), // Spazio tra le arcate
          
          // Arcata inferiore
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Inferiore DX
              ...[for (var i = 48; i >= 41; i--) _buildDenteButton(context, i.toString())],
              SizedBox(width: 20), // Spazio centrale
              // Inferiore SX
              ...[for (var i = 31; i <= 38; i++) _buildDenteButton(context, i.toString())],
            ],
          ),
        ],
      ),
    );
  }
}
