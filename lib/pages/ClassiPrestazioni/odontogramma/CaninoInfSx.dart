import 'package:shared_preferences/shared_preferences.dart';
import 'package:esercizi/pages/ClassiPrestazioni/odontogramma/pages-odontogramma.dart';
import 'package:flutter/material.dart';

class CaninoInfSx extends StatefulWidget {
  const CaninoInfSx({super.key});

  @override
  State<CaninoInfSx> createState() => _CaninoInfSx();
}

class _CaninoInfSx extends State<CaninoInfSx>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("33-Canino Inferiore SX"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
    );
  }
}