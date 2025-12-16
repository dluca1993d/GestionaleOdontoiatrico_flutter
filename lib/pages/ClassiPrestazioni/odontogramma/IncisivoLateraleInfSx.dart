import 'package:shared_preferences/shared_preferences.dart';
import 'package:esercizi/pages/ClassiPrestazioni/odontogramma/pages-odontogramma.dart';
import 'package:flutter/material.dart';

class IncisivoLateraleInfSx extends StatefulWidget {
  const IncisivoLateraleInfSx({super.key});

  @override
  State<IncisivoLateraleInfSx> createState() => _IncisivoLateraleInfSx();
}

class _IncisivoLateraleInfSx extends State<IncisivoLateraleInfSx>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("32-Incisivo Laterale Inf. SX"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
    );
  }
}