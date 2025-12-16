import 'package:shared_preferences/shared_preferences.dart';
import 'package:esercizi/pages/ClassiPrestazioni/odontogramma/pages-odontogramma.dart';
import 'package:flutter/material.dart';

class IncisivoLateraleSupDx extends StatefulWidget {
  const IncisivoLateraleSupDx({super.key});

  @override
  State<IncisivoLateraleSupDx> createState() => _IncisivoLateraleSupDx();
}

class _IncisivoLateraleSupDx extends State<IncisivoLateraleSupDx>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("12-Incisivo Laterale Sup. DX"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
    );
  }
}