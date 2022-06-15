// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:vucudunu_tani/views/kayit/kayit_eposta.dart';

late String kayit_ad;
late String kayit_soyad;

class KayitAdSoyadPage extends StatefulWidget {
  const KayitAdSoyadPage({Key? key}) : super(key: key);

  @override
  State<KayitAdSoyadPage> createState() => _KayitAdSoyadPageState();
}

class _KayitAdSoyadPageState extends State<KayitAdSoyadPage> {
  final TextEditingController kayit_ad_controller = TextEditingController();
  final TextEditingController kayit_soyad_controller = TextEditingController();

  var alper = "alper";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade300,
      body: Container(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: Image.asset(
                'assets/images/loginlogo.png',
                height: 100,
                width: 200,
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                constraints: const BoxConstraints.expand(),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35),
                        topRight: Radius.circular(35))),
                child: Form(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      const Text(
                        'Adın ve Soyadın',
                        style: TextStyle(
                            fontSize: 39, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: kayit_ad_controller,
                        decoration: InputDecoration(
                          hintText: 'Alper',
                          labelText: 'Adınız',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: kayit_soyad_controller,
                          decoration: InputDecoration(
                            hintText: 'Yüceer',
                            labelText: 'Soyadınız',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          )),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                            onPressed: () {
                              kayit_ad = kayit_ad_controller.text;
                              kayit_soyad = kayit_soyad_controller.text;

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => KayitEpostaPage()));
                            },
                            child: Text("Devam")),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
