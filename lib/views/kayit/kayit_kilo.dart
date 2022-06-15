// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:vucudunu_tani/views/kayit/kayit_boy.dart';

late int kayit_kilo;

class KayitKiloPage extends StatefulWidget {
  const KayitKiloPage({Key? key}) : super(key: key);

  @override
  State<KayitKiloPage> createState() => _KayitKiloPageState();
}

class _KayitKiloPageState extends State<KayitKiloPage> {
  final TextEditingController kayit_kilo_controller = TextEditingController();

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
                      'Kilonu Gir',
                      style:
                          TextStyle(fontSize: 39, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                        controller: kayit_kilo_controller,
                        decoration: InputDecoration(
                          hintText: '65',
                          labelText: 'Kilo',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          onPressed: () {
                            kayit_kilo = int.parse(kayit_kilo_controller.text);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => KayitBoyPage()));
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
