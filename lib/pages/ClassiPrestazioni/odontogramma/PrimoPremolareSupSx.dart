import 'package:shared_preferences/shared_preferences.dart';
import 'package:esercizi/pages/ClassiPrestazioni/odontogramma/pages-odontogramma.dart';
import 'package:flutter/material.dart';

class PrimoPremolareSupSx extends StatefulWidget {
  const PrimoPremolareSupSx({super.key});

  @override
  State<PrimoPremolareSupSx> createState() => _PrimoPremolareSupSx();
}

class _PrimoPremolareSupSx extends State<PrimoPremolareSupSx>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("24-Primo Premolare Superiore SX"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
    );
  }
}