import 'package:shared_preferences/shared_preferences.dart';
import 'package:esercizi/pages/ClassiPrestazioni/odontogramma/pages-odontogramma.dart';
import 'package:flutter/material.dart';

class PrimoPremolareInfDx extends StatefulWidget {
  const PrimoPremolareInfDx({super.key});

  @override
  State<PrimoPremolareInfDx> createState() => _PrimoPremolareInfDx();
}

class _PrimoPremolareInfDx extends State<PrimoPremolareInfDx>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("44-Primo Premolare Inferiore DX"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
    );
  }
}