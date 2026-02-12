import 'package:esercizi/pages/ClassiPrestazioni/altrePrestazioni/prestazione_page.dart';
import 'package:flutter/material.dart';

class Igiene extends StatelessWidget {
  const Igiene({super.key});

  @override
  Widget build(BuildContext context) {
    return PrestazionePage(
      tipoPrestazione: "Igiene Dentale",
    );
  }
}
