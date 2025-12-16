
import 'package:esercizi/pages/ClassiPrestazioni/Igiene.dart';
import 'package:esercizi/pages/ClassiPrestazioni/Visita.dart';
import 'package:esercizi/pages/ClassiPrestazioni/odontogramma/pages-odontogramma.dart';

import 'package:esercizi/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Prestazioni extends StatefulWidget {
  @override
  State<Prestazioni> createState() => _Prestazioni();
}

class _Prestazioni extends State<Prestazioni>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Prestazioni"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),

      body: 
      Column(
        spacing: 25,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          //🦷 Visita 🦷
          ElevatedButton(onPressed: (){
                setState(() {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Visita())); });}, 
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(132, 33, 149, 243),
                  foregroundColor: Colors.white),
                  child: Text("Visita"),),

          //🦷 Igiene 🦷
          ElevatedButton(onPressed: (){
                setState(() {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Igiene())); });}, 
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(132, 33, 149, 243),
                  foregroundColor: Colors.white),
                  child: Text("Igiene Dentale"),),],),

          //🦷 Odontogramma 🦷
          Text("ODONTOGRAMMA:", style: TextStyle(color: Colors.blue, fontSize: 20),),
          Column(
            children: [
              Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              // 🦷 ARCATA SUPERIORE - DESTRA
                Tooltip( 
                  message: "18-Terzo Molare Superiore DX", waitDuration: Duration(milliseconds: 100),showDuration: Duration(milliseconds: 100),preferBelow: false, 
                  child: 
                  GestureDetector(onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => TerzoMolareSupDx())); }, child: Image.asset("assets/terzo-molare-sup-dx.png",))),
                Tooltip( 
                  message:"17-Secondo Molare Superiore DX" , waitDuration: Duration(milliseconds: 100),showDuration: Duration(milliseconds: 100),preferBelow: false, 
                  child: 
                  GestureDetector(onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => SecondoMolareSupDx())); }, child: Image.asset("assets/secondo-molare-sup-dx.png")),),
                Tooltip( 
                  message:"16-Primo Molare Superiore DX" , waitDuration: Duration(milliseconds: 100),showDuration: Duration(milliseconds: 100),preferBelow: false, 
                  child: 
                  GestureDetector(onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => PrimoMolareSupDx())); }, child: Image.asset("assets/primo-molare-sup-dx.png")),),
                Tooltip( 
                  message:"15-Secondo Premolare Superiore Dx", waitDuration: Duration(milliseconds: 100),showDuration: Duration(milliseconds: 100),preferBelow: false, 
                  child: 
                  GestureDetector(onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => SecondoPremolareSupDx())); }, child: Image.asset("assets/secondo-premolare-sup-dx.png")),),
                Tooltip( 
                  message:"14-Primo Premolare Superiore DX", waitDuration: Duration(milliseconds: 100),showDuration: Duration(milliseconds: 100),preferBelow: false, 
                  child: 
                  GestureDetector(onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => PrimoPremolareSupDx())); }, child: Image.asset("assets/primo-premolare-sup-dx.png")),),
                Tooltip( 
                  message:"13-Canino Superiore Dx ", waitDuration: Duration(milliseconds: 100),showDuration: Duration(milliseconds: 100),preferBelow: false, 
                  child: 
                  GestureDetector(onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => CaninoSupDx())); }, child: Image.asset("assets/canino-sup-dx.png")),),
                Tooltip( 
                  message:"12-Incisivo Laterale Superiore DX", waitDuration: Duration(milliseconds: 100),showDuration: Duration(milliseconds: 100),preferBelow: false, 
                  child: 
                  GestureDetector(onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => IncisivoLateraleSupDx())); }, child: Image.asset("assets/incisivo-lat-sup-dx.png")),),
                Tooltip( 
                  message:"11-Incisivo Superiore Dx", waitDuration: Duration(milliseconds: 100),showDuration: Duration(milliseconds: 100),preferBelow: false, 
                  child: 
                  GestureDetector(onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => IncisivoSupDx())); }, child: Image.asset("assets/incisivo-sup-dx.png")),),
              
              // 🦷 ARCATA SUPERIORE - SINISTRA
                Tooltip( 
                  message:"21-Incisivo Superiore SX", waitDuration: Duration(milliseconds: 100),showDuration: Duration(milliseconds: 100),preferBelow: false, 
                  child: 
                  GestureDetector(onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => IncisivoSupSx())); }, child: Image.asset("assets/incisivo-sup-sx.png")),),
                Tooltip( 
                  message:"22-Incisivo Laterale Superiore DX", waitDuration: Duration(milliseconds: 100),showDuration: Duration(milliseconds: 100),preferBelow: false, 
                  child: 
                  GestureDetector(onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => CaninoSupSx())); }, child: Image.asset("assets/incisivo-lat-sup-sx.png")),),
                Tooltip( 
                  message:"2-Canino Superiore DX", waitDuration: Duration(milliseconds: 100),showDuration: Duration(milliseconds: 100),preferBelow: false, 
                  child: 
                  GestureDetector(onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => CaninoSupSx())); }, child: Image.asset("assets/canino-sup-sx.png")),),
                Tooltip( 
                  message:"24-Primo Premolare Superiore SX" , waitDuration: Duration(milliseconds: 100),showDuration: Duration(milliseconds: 100),preferBelow: false, 
                  child: 
                  GestureDetector(onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => PrimoPremolareSupSx())); }, child: Image.asset("assets/primo-premolare-sup-sx.png")),),
                Tooltip( 
                  message:"25-Secondo Premolare Superiore SX" , waitDuration: Duration(milliseconds: 100),showDuration: Duration(milliseconds: 100),preferBelow: false, 
                    child: 
                  GestureDetector(onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => SecondoPremolareSupSx())); }, child: Image.asset("assets/secondo-premolare-sup-sx.png")),),
                Tooltip( 
                  message:"26-Primo Molare Superiore SX" , waitDuration: Duration(milliseconds: 100),showDuration: Duration(milliseconds: 100),preferBelow: false, 
                  child: 
                  GestureDetector(onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => PrimoMolareSupSx())); }, child: Image.asset("assets/primo-molare-sup-sx.png")),),
                Tooltip( 
                  message:"27-Secondo Molare Superiore SX" , waitDuration: Duration(milliseconds: 100),showDuration: Duration(milliseconds: 100),preferBelow: false, 
                  child: 
                  GestureDetector(onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => SecondoMolareSupSx())); }, child: Image.asset("assets/secondo-molare-sup-sx.png")),),
                Tooltip( 
                  message:"28-Terzo Molare Superiore SX" , waitDuration: Duration(milliseconds: 100),showDuration: Duration(milliseconds: 100),preferBelow: false, 
                  child: 
                  GestureDetector(onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => TerzoMolareSupSx())); }, child: Image.asset("assets/terzo-molare-sup-sx.png")),),
                ],
              ),
              Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              // 🦷 ARCATA INFERIORE - DESTRA
                Tooltip( 
                  message:"48-Terzo Molare Inferiore DX" , waitDuration: Duration(milliseconds: 100),showDuration: Duration(milliseconds: 100),preferBelow: false, 
                  child: 
                  GestureDetector(onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => TerzoMolareInfDx())); }, child: Image.asset("assets/terzo-molare-inf-dx.png")),),
                Tooltip( 
                  message:"47-Secondo Molare Inferiore DX" , waitDuration: Duration(milliseconds: 100),showDuration: Duration(milliseconds: 100),preferBelow: false, 
                  child: 
                  GestureDetector(onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => SecondoMolareInfDx())); }, child: Image.asset("assets/secondo-molare-inf-dx.png")),),
                Tooltip( 
                  message:"46-Primo Molare Inferiore DX" , waitDuration: Duration(milliseconds: 100),showDuration: Duration(milliseconds: 100),preferBelow: false, 
                  child: 
                  GestureDetector(onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => PrimoMolareInfDx())); }, child: Image.asset("assets/primo-molare-inf-dx.png")),),
                Tooltip( 
                  message:"45-Secondo Premolare Inferiore DX" , waitDuration: Duration(milliseconds: 100),showDuration: Duration(milliseconds: 100),preferBelow: false, 
                  child: 
                  GestureDetector(onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => SecondoPremolareInfDx())); }, child: Image.asset("assets/secondo-premolare-inf-dx.png")),),
                Tooltip( 
                  message:"44-Primo Premolare Inferiore DX" , waitDuration: Duration(milliseconds: 100),showDuration: Duration(milliseconds: 100),preferBelow: false, 
                  child: 
                  GestureDetector(onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => PrimoPremolareInfDx())); }, child: Image.asset("assets/primo-premolare-inf-dx.png")),),
                Tooltip( 
                  message:"43-Canino Inferiore DX" , waitDuration: Duration(milliseconds: 100),showDuration: Duration(milliseconds: 100),preferBelow: false, 
                  child: 
                  GestureDetector(onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => CaninoInfDx())); }, child: Image.asset("assets/canino-inf-dx.png")),),
                Tooltip( 
                  message:"42-Incisivo Laterale Inferiore DX" , waitDuration: Duration(milliseconds: 100),showDuration: Duration(milliseconds: 100),preferBelow: false, 
                  child: 
                  GestureDetector(onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => IncisivoLateraleInfDx())); }, child: Image.asset("assets/incisivo-lat-inf-dx.png")),),
                Tooltip( 
                  message:"41-Incisivo Inferiore DX" , waitDuration: Duration(milliseconds: 100),showDuration: Duration(milliseconds: 100),preferBelow: false, 
                  child: 
                  GestureDetector(onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => IncisivoInfDx())); }, child: Image.asset("assets/incisivo-inf-dx.png")),),
              
              // 🦷 ARCATA INFERIORE - SINISTRA
                Tooltip( 
                  message:"31-Incisivo Inferiore SX" , waitDuration: Duration(milliseconds: 100),showDuration: Duration(milliseconds: 100),preferBelow: false, 
                  child: 
                  GestureDetector(onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => IncisivoInfSx())); }, child: Image.asset("assets/incisivo-inf-sx.png")),),
                Tooltip( 
                  message:"32-Incisivo Laterale Inferiore SX" , waitDuration: Duration(milliseconds: 100),showDuration: Duration(milliseconds: 100),preferBelow: false, 
                  child: 
                  GestureDetector(onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => IncisivoLateraleInfSx())); }, child: Image.asset("assets/incisivo-lat-inf-sx.png")),),
                Tooltip( 
                  message:"33-Canino Inferiore SX" , waitDuration: Duration(milliseconds: 100),showDuration: Duration(milliseconds: 100),preferBelow: false, 
                  child: 
                  GestureDetector(onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => CaninoInfSx())); }, child: Image.asset("assets/canino-inf-sx.png")),),
                Tooltip( 
                  message:"34-Primo Premolare Inferiore SX" , waitDuration: Duration(milliseconds: 100),showDuration: Duration(milliseconds: 100),preferBelow: false, 
                  child: 
                  GestureDetector(onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => PrimoPremolareInfSx())); }, child: Image.asset("assets/primo-premolare-inf-sx.png")),),
                Tooltip( 
                  message:"35-Secondo Premolare Inferiore SX" , waitDuration: Duration(milliseconds: 100),showDuration: Duration(milliseconds: 100),preferBelow: false, 
                  child: 
                  GestureDetector(onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => SecondoPremolareInfSx())); }, child: Image.asset("assets/secondo-premolare-inf-sx.png")),),
                Tooltip( 
                  message:"36-Primo Molare Inferiore SX" , waitDuration: Duration(milliseconds: 100),showDuration: Duration(milliseconds: 100),preferBelow: false, 
                  child: 
                  GestureDetector(onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => PrimoMolareInfSx())); }, child: Image.asset("assets/primo-molare-inf-sx.png")),),
                Tooltip( 
                  message:"37-Secondo Molare Inferiore SX" , waitDuration: Duration(milliseconds: 100),showDuration: Duration(milliseconds: 100),preferBelow: false, 
                  child: 
                  GestureDetector(onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => SecondoMolareInfSx())); }, child: Image.asset("assets/secondo-molare-inf-sx.png")),),
                Tooltip( 
                  message:"38-Terzo Molare Inferiore SX" , waitDuration: Duration(milliseconds: 100),showDuration: Duration(milliseconds: 100),preferBelow: false, 
                  child: 
                  GestureDetector(onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => TerzoMolareInfSx())); }, child: Image.asset("assets/terzo-molare-inf-sx.png")),),
                ],
              ),
            ],
          ),
        ],
      ),
      );
  }
}