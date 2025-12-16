import 'package:shared_preferences/shared_preferences.dart';
import 'package:esercizi/pages/ClassiPrestazioni/odontogramma/pages-odontogramma.dart';
import 'package:flutter/material.dart';

class IncisivoSupSx extends StatefulWidget {
  const IncisivoSupSx({super.key});

  @override
  State<IncisivoSupSx> createState() => _IncisivoSupSx();
}

class _IncisivoSupSx extends State<IncisivoSupSx>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("21-Incisivo Superiore SX"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
    );
  }
}