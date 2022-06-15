// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:vucudunu_tani/views/kayit/kayit_yas.dart';

late String kayit_parola;

class KayitParolaPage extends StatefulWidget {
  const KayitParolaPage({Key? key}) : super(key: key);

  @override
  State<KayitParolaPage> createState() => _KayitParolaPageState();
}

class _KayitParolaPageState extends State<KayitParolaPage> {
  final TextEditingController kayit_parola_controller = TextEditingController();

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
                      'Parola Belirle',
                      style:
                          TextStyle(fontSize: 39, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                        controller: kayit_parola_controller,
                        decoration: InputDecoration(
                          hintText: 'Bir parola belirleyiniz',
                          labelText: 'Parola',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          onPressed: () {
                            kayit_parola = kayit_parola_controller.text;
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => KayitYasPage()));
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
