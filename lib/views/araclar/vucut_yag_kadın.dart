import 'dart:math';

import 'package:flutter/material.dart';
import 'package:vucudunu_tani/views/araclar/idealyagoranikadin.dart';

class VucutYagKadinPage extends StatefulWidget {
  const VucutYagKadinPage({Key? key}) : super(key: key);

  @override
  State<VucutYagKadinPage> createState() => _VucutYagKadinPageState();
}

class _VucutYagKadinPageState extends State<VucutYagKadinPage> {
  late TextEditingController _kalcaController;
  late TextEditingController _belController;
  late TextEditingController _boyunController;
  late TextEditingController _boyController;
  double vucutYagOrani = 0;
  @override
  void initState() {
    _kalcaController = TextEditingController();
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
                    controller: _kalcaController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.workspaces_filled),
                        hintText: 'Örn 90',
                        labelText: 'Kalça çevrenizi CM cinsinden giriniz',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 50, top: 30),
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
                          vucutYagOrani = kadinYagOraniHesapla(
                              double.parse(_kalcaController.text),
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
                              builder: (context) => IdealYagOraniKadinPage()));
                    },
                    child: Container(
                      child: Text(
                        "Kadin İdeal Yağ Oranı Tablosu İçin Tıklayınız",
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

double kadinYagOraniHesapla(
    double belCevre, double kalcaCevre, double boyunCevre, double boyUzunlugu) {
  return ((495) /
          (1.29579 -
              (0.35004 * log((belCevre + kalcaCevre - boyunCevre) / ln10))) +
      (0.22100 * log((boyUzunlugu) / ln10)) -
      450);
}
