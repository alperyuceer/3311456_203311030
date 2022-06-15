// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:vucudunu_tani/views/giris_yada_kayit.dart';
import 'package:vucudunu_tani/views/kayit/kayit_eposta.dart';
import 'package:vucudunu_tani/views/kayit/kayit_parola.dart';
import 'kayit_ad_soyad.dart';
import 'package:vucudunu_tani/service/auth.dart';
import 'kayit_kilo.dart';
import 'kayit_yas.dart';

class KayitBoyPage extends StatefulWidget {
  const KayitBoyPage({Key? key}) : super(key: key);

  @override
  State<KayitBoyPage> createState() => _KayitBoyPageState();
}

class _KayitBoyPageState extends State<KayitBoyPage> {
  final TextEditingController kayit_boy_controller = TextEditingController();
  late int kayit_boy;
  AuthService _authService = AuthService();

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
                      'Boyunu Gir',
                      style:
                          TextStyle(fontSize: 39, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                        controller: kayit_boy_controller,
                        decoration: InputDecoration(
                          hintText: '175',
                          labelText: 'Boy(cm)',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          onPressed: () {
                            kayit_boy = int.parse(kayit_boy_controller.text);
                            print(
                                "ad: $kayit_ad soyad: $kayit_soyad eposta: $kayit_eposta parola: $kayit_parola yas: $kayit_yas boy: $kayit_yas kilo:$kayit_kilo ");

                            _authService
                                .createPerson(
                                    kayit_ad,
                                    kayit_soyad,
                                    kayit_eposta,
                                    kayit_parola,
                                    kayit_yas,
                                    kayit_kilo,
                                    kayit_boy)
                                .then((value) {
                              return Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => GirisYaDaKayitPage(),
                                  ));
                            });

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        GirisYaDaKayitPage()));
                          },
                          child: Text("Kayıtı Tamamla")),
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
