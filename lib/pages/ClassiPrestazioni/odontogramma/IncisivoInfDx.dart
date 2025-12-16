import 'package:shared_preferences/shared_preferences.dart';
import 'package:esercizi/pages/ClassiPrestazioni/odontogramma/pages-odontogramma.dart';
import 'package:flutter/material.dart';

class IncisivoInfDx extends StatefulWidget {
  const IncisivoInfDx({super.key});

  @override
  State<IncisivoInfDx> createState() => _IncisivoInfDx();
}

class _IncisivoInfDx extends State<IncisivoInfDx>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("41-Incisivo Inferiore DX"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
    );
  }
}