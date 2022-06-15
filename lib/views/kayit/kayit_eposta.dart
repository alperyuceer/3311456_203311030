// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:vucudunu_tani/views/kayit/kayit_parola.dart';

late String kayit_eposta;

class KayitEpostaPage extends StatefulWidget {
  const KayitEpostaPage({Key? key}) : super(key: key);

  @override
  State<KayitEpostaPage> createState() => _KayitEpostaPageState();
}

class _KayitEpostaPageState extends State<KayitEpostaPage> {
  final TextEditingController kayit_eposta_controller = TextEditingController();

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
                      'E-postanı Gir',
                      style:
                          TextStyle(fontSize: 39, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                        controller: kayit_eposta_controller,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: 'alper@yuceermail.com',
                          labelText: 'E-posta',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          onPressed: () {
                            kayit_eposta = kayit_eposta_controller.text;
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => KayitParolaPage()));
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
