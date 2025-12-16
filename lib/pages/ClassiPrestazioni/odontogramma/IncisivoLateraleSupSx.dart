import 'package:shared_preferences/shared_preferences.dart';
import 'package:esercizi/pages/ClassiPrestazioni/odontogramma/pages-odontogramma.dart';
import 'package:flutter/material.dart';

class IncisivoLateraleSupSx extends StatefulWidget {
  const IncisivoLateraleSupSx({super.key});

  @override
  State<IncisivoLateraleSupSx> createState() => _IncisivoLateraleSupSx();
}

class _IncisivoLateraleSupSx extends State<IncisivoLateraleSupSx>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("22-Incisivo Laterale Sup. SX"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
    );
  }
}