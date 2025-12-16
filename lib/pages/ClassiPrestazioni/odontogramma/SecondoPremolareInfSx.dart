import 'package:esercizi/pages/ClassiPrestazioni/odontogramma/pages-odontogramma.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SecondoPremolareInfSx extends StatefulWidget {
  const SecondoPremolareInfSx({super.key});

  @override
  State<SecondoPremolareInfSx> createState() => _SecondoPremolareInfSx();
}

class _SecondoPremolareInfSx extends State<SecondoPremolareInfSx>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("35-Secondo Premolare Inf. SX"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
    );
  }
}