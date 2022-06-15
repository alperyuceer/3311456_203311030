import 'package:flutter/material.dart';

class VucutKitleTabloPage extends StatelessWidget {
  const VucutKitleTabloPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            "assets/images/tablolar/vucutkitleindeksi.jpg",
          ),
        ),
      ),
    );
  }
}
