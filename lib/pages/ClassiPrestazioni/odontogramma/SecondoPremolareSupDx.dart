import 'package:esercizi/pages/ClassiPrestazioni/odontogramma/pages-odontogramma.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SecondoPremolareSupDx extends StatefulWidget {
  const SecondoPremolareSupDx({super.key});

  @override
  State<SecondoPremolareSupDx> createState() => _SecondoPremolareSupDx();
}

class _SecondoPremolareSupDx extends State<SecondoPremolareSupDx>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("15-Secondo Premolare Sup. DX"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
    );
  }
}