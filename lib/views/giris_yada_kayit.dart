import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:vucudunu_tani/views/kayit/kayit_ad_soyad.dart';
import 'giris_yap.dart';

class GirisYaDaKayitPage extends StatefulWidget {
  const GirisYaDaKayitPage({Key? key}) : super(key: key);

  @override
  State<GirisYaDaKayitPage> createState() => _GirisYaDaKayitPageState();
}

class _GirisYaDaKayitPageState extends State<GirisYaDaKayitPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/loginorsignup.jpg"),
              fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //blur efekti
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
              child: Container(
                decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
              ),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const GirisYapPage()),
                );
              },
              child:
                  const Text("GİRİŞ YAP", style: const TextStyle(fontSize: 25)),
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  fixedSize: const Size(300, 100),
                  primary: Colors.yellow.shade300.withOpacity(0.7),
                  onPrimary: Colors.black),
            ),

            const SizedBox(
              height: 50,
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const KayitAdSoyadPage()),
                );
              },
              child: const Text("KAYIT OL", style: TextStyle(fontSize: 25)),
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  fixedSize: const Size(300, 100),
                  primary: Colors.yellow.shade300.withOpacity(0.7),
                  onPrimary: Colors.black),
            ),
          ],
        ));
  }
}
