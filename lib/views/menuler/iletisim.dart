// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class IletisimPage extends StatelessWidget {
  const IletisimPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("İLETİŞİM BİLGİLERİ"),
        backgroundColor: Colors.indigo.shade300,
      ),
      backgroundColor: Colors.yellow.shade300,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            color: Colors.indigo.shade300,
            child: ListTile(
              leading: Icon(Icons.mail),
              title: Text(
                "yuceeralper06@gmail.com",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          SizedBox(
            height: 60,
          ),
          Card(
            color: Colors.indigo.shade300,
            child: ListTile(
              leading: Icon(Icons.phone),
              title: Text(
                "+90-507-005-0000",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
