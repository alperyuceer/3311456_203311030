// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:vucudunu_tani/views/araclar/kronometre.dart';
import 'package:vucudunu_tani/views/araclar/vucutkitlecinsiyet.dart';
import 'package:vucudunu_tani/views/araclar/vucutkitlehesaplama.dart';

class AraclarPage extends StatefulWidget {
  const AraclarPage({Key? key}) : super(key: key);

  @override
  State<AraclarPage> createState() => _AraclarPageState();
}

class _AraclarPageState extends State<AraclarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Wrap(
            direction: Axis.vertical,
            alignment: WrapAlignment.center,
            spacing: 10.0,
            runSpacing: 10.0,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => KronometrePage()));
                },
                child: CircleAvatar(
                  backgroundColor: Colors.yellow.shade300,
                  radius: 100,
                  child: Text("KRONOMETRE",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black)),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => VucutYagCinsiyetPage()));
                },
                child: CircleAvatar(
                  backgroundColor: Colors.yellow.shade300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Vücut Yağ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                      Text("Oranı Hesaplayıcı",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black))
                    ],
                  ),
                  radius: 100,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => VucutKitleHesaplamaPage()));
                },
                child: CircleAvatar(
                  backgroundColor: Colors.yellow.shade300,
                  child: RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: "Vücut ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black)),
                    TextSpan(
                        text: "Kitle ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black)),
                    TextSpan(
                        text: "İndeksi ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black)),
                    TextSpan(
                        text: "Hesaplayıcı",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black))
                  ])),
                  radius: 100,
                ),
              ),
            ],
          ),
        ));
  }
}
