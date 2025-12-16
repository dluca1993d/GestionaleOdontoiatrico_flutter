import 'package:shared_preferences/shared_preferences.dart';
import 'package:esercizi/pages/ClassiPrestazioni/odontogramma/pages-odontogramma.dart';
import 'package:flutter/material.dart';

class CaninoSupSx extends StatefulWidget {
  const CaninoSupSx({super.key});

  @override
  State<CaninoSupSx> createState() => _CaninoSupSx();
}

class _CaninoSupSx extends State<CaninoSupSx>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("23-Canino Superiore SX"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
    );
  }
}