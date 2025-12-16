import 'package:esercizi/pages/ClassiPrestazioni/odontogramma/pages-odontogramma.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SecondoPremolareInfDx extends StatefulWidget {
  const SecondoPremolareInfDx({super.key});

  @override
  State<SecondoPremolareInfDx> createState() => _SecondoPremolareInfDx();
}

class _SecondoPremolareInfDx extends State<SecondoPremolareInfDx>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("45-Secondo Premolare Inf. DX"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
    );
  }
}