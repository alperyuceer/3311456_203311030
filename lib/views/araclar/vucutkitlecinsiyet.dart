// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:vucudunu_tani/views/araclar/vucut_yag_erkek.dart';
import 'vucut_yag_kadın.dart';

class VucutYagCinsiyetPage extends StatefulWidget {
  const VucutYagCinsiyetPage({Key? key}) : super(key: key);

  @override
  State<VucutYagCinsiyetPage> createState() => _VucutYagCinsiyetPageState();
}

class _VucutYagCinsiyetPageState extends State<VucutYagCinsiyetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade300,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "CİNSİYETİNİZİ SEÇİNİZ",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => VucutYagKadinPage()));
                  },
                  child: CircleAvatar(
                    child: Icon(
                      Icons.girl,
                      size: 150,
                    ),
                    backgroundColor: Colors.pink,
                    radius: 75,
                  ),
                ),
                SizedBox(
                  width: 60,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => VucutYagErkekPage()));
                  },
                  child: CircleAvatar(
                    child: Icon(
                      Icons.boy,
                      size: 150,
                    ),
                    backgroundColor: Colors.blue,
                    radius: 75,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
