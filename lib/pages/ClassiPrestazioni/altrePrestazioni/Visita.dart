import 'package:esercizi/pages/ClassiPrestazioni/altrePrestazioni/prestazione_page.dart';
import 'package:flutter/material.dart';

class Visita extends StatelessWidget {
  const Visita({super.key});

  @override
  Widget build(BuildContext context) {
    return PrestazionePage(
      tipoPrestazione: "Visita",
    );
  }
}
