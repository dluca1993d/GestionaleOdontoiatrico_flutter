import 'package:shared_preferences/shared_preferences.dart';
import 'package:esercizi/pages/ClassiPrestazioni/odontogramma/pages-odontogramma.dart';
import 'package:flutter/material.dart';

class IncisivoSupDx extends StatefulWidget {
  const IncisivoSupDx({super.key});

  @override
  State<IncisivoSupDx> createState() => _IncisivoSupDx();
}

class _IncisivoSupDx extends State<IncisivoSupDx>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("11-Incisivo Superiore DX"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
    );
  }
}