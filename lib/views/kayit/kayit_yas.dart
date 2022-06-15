// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'kayit_kilo.dart';

late int kayit_yas;

class KayitYasPage extends StatefulWidget {
  const KayitYasPage({Key? key}) : super(key: key);

  @override
  State<KayitYasPage> createState() => _KayitYasPageState();
}

class _KayitYasPageState extends State<KayitYasPage> {
  final TextEditingController kayit_yas_controller = TextEditingController();
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
                child: Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    const Text(
                      'Yaşını Seç',
                      style:
                          TextStyle(fontSize: 39, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                        controller: kayit_yas_controller,
                        decoration: InputDecoration(
                          hintText: 'Yaşınız',
                          labelText: 'Yaş',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          onPressed: () {
                            kayit_yas = int.parse(kayit_yas_controller.text);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => KayitKiloPage()));
                          },
                          child: Text("Devam")),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
