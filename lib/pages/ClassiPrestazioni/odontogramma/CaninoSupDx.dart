import 'package:shared_preferences/shared_preferences.dart';
import 'package:esercizi/pages/ClassiPrestazioni/odontogramma/pages-odontogramma.dart';
import 'package:flutter/material.dart';

class CaninoSupDx extends StatefulWidget {
  const CaninoSupDx({super.key});

  @override
  State<CaninoSupDx> createState() => _CaninoSupDx();
}

class _CaninoSupDx extends State<CaninoSupDx>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("13-Canino Superiore DX"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
    );
  }
}