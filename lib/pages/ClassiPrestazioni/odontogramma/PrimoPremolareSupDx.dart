import 'package:esercizi/pages/ClassiPrestazioni/odontogramma/pages-odontogramma.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrimoPremolareSupDx extends StatefulWidget {
  const PrimoPremolareSupDx({super.key});

  @override
  State<PrimoPremolareSupDx> createState() => _PrimoPremolareSupDx();
}

class _PrimoPremolareSupDx extends State<PrimoPremolareSupDx>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("14-Primo Premolare Superiore DX"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
    );
  }
}