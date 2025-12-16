import 'package:shared_preferences/shared_preferences.dart';
import 'package:esercizi/pages/ClassiPrestazioni/odontogramma/pages-odontogramma.dart';
import 'package:flutter/material.dart';

class IncisivoLateraleInfDx extends StatefulWidget {
  const IncisivoLateraleInfDx({super.key});

  @override
  State<IncisivoLateraleInfDx> createState() => _IncisivoLateraleInfDx();
}

class _IncisivoLateraleInfDx extends State<IncisivoLateraleInfDx>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("42-Incisivo Laterale Inf. DX"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
    );
  }
}