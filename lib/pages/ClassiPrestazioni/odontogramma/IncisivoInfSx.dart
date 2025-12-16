import 'package:shared_preferences/shared_preferences.dart';
import 'package:esercizi/pages/ClassiPrestazioni/odontogramma/pages-odontogramma.dart';
import 'package:flutter/material.dart';

class IncisivoInfSx extends StatefulWidget {
  const IncisivoInfSx({super.key});

  @override
  State<IncisivoInfSx> createState() => _IncisivoInfSx();
}

class _IncisivoInfSx extends State<IncisivoInfSx>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("31-Incisivo Inferiore SX"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
    );
  }
}