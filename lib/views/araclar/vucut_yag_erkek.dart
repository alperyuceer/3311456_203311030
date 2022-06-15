// ignore_for_file: prefer_const_constructors

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:vucudunu_tani/views/araclar/idealyagoranierkek.dart';

class VucutYagErkekPage extends StatefulWidget {
  const VucutYagErkekPage({Key? key}) : super(key: key);

  @override
  State<VucutYagErkekPage> createState() => _VucutYagErkekPageState();
}

class _VucutYagErkekPageState extends State<VucutYagErkekPage> {
  late TextEditingController _belController;
  late TextEditingController _boyunController;
  late TextEditingController _boyController;
  double vucutYagOrani = 0;
  @override
  void initState() {
    _boyController = TextEditingController();
    _belController = TextEditingController();
    _boyunController = TextEditingController();

    // TODO: implement initState
    super.initState();
  }

  void dispose() {
    _boyController.dispose();
    _belController.dispose();
    _boyunController.dispose();

    // TODO: implement initState
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade300,
      body: Container(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "VÜCUT YAĞ ORANINIZ",
                  style: TextStyle(fontSize: 30),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 150.0, top: 40),
                  child: Text(
                    "${vucutYagOrani}",
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 50),
                  child: TextFormField(
                    controller: _belController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.workspaces_filled),
                        hintText: 'Örn 50',
                        labelText: 'Bel çevrenizi CM cinsinden giriniz',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 50, top: 30),
                  child: TextFormField(
                    controller: _boyunController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.workspaces_filled),
                        hintText: 'Örn 10',
                        labelText: 'Boyun çevrenizi CM cinsinden giriniz',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 50, top: 30),
                  child: TextFormField(
                    controller: _boyController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.workspaces_filled),
                        hintText: 'Örn 172',
                        labelText: 'Boyunuzu CM cinsinden giriniz',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        )),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          vucutYagOrani = erkekYagOraniHesapla(
                              double.parse(_belController.text),
                              double.parse(_boyunController.text),
                              double.parse(_boyController.text));
                        });
                      },
                      child: Text("HESAPLA")),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 80),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => IdealYagOraniErkekPage()));
                    },
                    child: Container(
                      child: Text(
                        "Erkek İdeal Yağ Oranı Tablosu İçin Tıklayınız",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

double erkekYagOraniHesapla(
    double belCevre, double boyunCevre, double boyUzunlugu) {
  return ((495) / (1.0324 - (0.19077 * log((belCevre - boyunCevre) / ln10))) +
      (0.15456 * log((boyUzunlugu) / ln10)) -
      450);
}
