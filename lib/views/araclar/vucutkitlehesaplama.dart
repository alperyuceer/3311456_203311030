import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:vucudunu_tani/views/araclar/kayitliindeksler.dart';
import 'package:vucudunu_tani/views/araclar/vucutkitletablo.dart';
import 'package:vucudunu_tani/main.dart';

class VucutKitleHesaplamaPage extends StatefulWidget {
  const VucutKitleHesaplamaPage({Key? key}) : super(key: key);

  @override
  State<VucutKitleHesaplamaPage> createState() =>
      _VucutKitleHesaplamaPageState();
}

class _VucutKitleHesaplamaPageState extends State<VucutKitleHesaplamaPage> {
  late TextEditingController _kiloController;
  late TextEditingController _boyController;
  double vucutKitleIndeksi = 0;
  @override
  void initState() {
    _boyController = TextEditingController();
    _kiloController = TextEditingController();

    // TODO: implement initState
    super.initState();
  }

  void dispose() {
    _boyController.dispose();
    _kiloController.dispose();

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
                  "VÜCUT KİTLE İNDEKSİNİZ",
                  style: TextStyle(fontSize: 30),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 150.0, top: 40),
                  child: Text(
                    "${vucutKitleIndeksi} BMI",
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 50),
                  child: TextFormField(
                    controller: _kiloController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.workspaces_filled),
                        hintText: 'Örn 80',
                        labelText: 'Kilonuzu KG cinsinden yazınız',
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
                          var box = Hive.box("vkiveriler");

                          vucutKitleIndeksi = vkihesapla(
                              int.parse(_boyController.text),
                              int.parse(_kiloController.text));

                          box.add(vucutKitleIndeksi);
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
                              builder: (context) => VucutKitleTabloPage()));
                    },
                    child: Container(
                      child: Text(
                        "Vücut Kitle İndeksi Tablosu İçin Tıklayınız",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 80),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => KayitliIndekslerPage()));
                    },
                    child: Container(
                      child: Text(
                        "Önceden Ölçülenler",
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
