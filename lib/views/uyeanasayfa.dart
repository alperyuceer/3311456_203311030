// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:analog_clock/analog_clock.dart';
import 'package:flutter/material.dart';
import 'package:vucudunu_tani/main.dart';
import 'package:vucudunu_tani/views/giris_yap.dart';

class UyeAnaSayfaPage extends StatefulWidget {
  const UyeAnaSayfaPage({Key? key}) : super(key: key);

  @override
  State<UyeAnaSayfaPage> createState() => _UyeAnaSayfaPageState();
}

class _UyeAnaSayfaPageState extends State<UyeAnaSayfaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade100,
      extendBody: true,
      body: SingleChildScrollView(
        child: Container(
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.yellow.shade300,
                    border: Border.all(
                        color: Colors.black,
                        width: 4.0,
                        style: BorderStyle.solid),
                  ),
                  margin: EdgeInsets.only(left: 0, right: 0),
                  width: double.infinity,
                  height: 100,
                  child: Center(
                    child: Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Text(
                          "${map['ad']} ${map['soyad']}",
                          style: TextStyle(fontSize: 30),
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 250,
                        height: 250,
                        child: AnalogClock(),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        child: Column(children: [
                          Text(
                            "BOY",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30),
                          ),
                          Padding(
                              padding: EdgeInsets.only(top: 60),
                              child: Text(
                                "${map["boy"].toString()} CM",
                                style: TextStyle(fontSize: 46),
                              ))
                        ]),
                        decoration: BoxDecoration(
                          color: Colors.yellow.shade300,
                          border: Border.all(
                              color: Colors.black,
                              width: 4.0,
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ), //Box

                        height: 250,
                        width: 170,
                      ),
                      Container(
                        child: Column(children: [
                          Text(
                            "KİLO",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30),
                          ),
                          Padding(
                              padding: EdgeInsets.only(top: 60),
                              child: Text(
                                "${map["kilo"].toString()} KG",
                                style: TextStyle(fontSize: 50),
                              ))
                        ]),
                        decoration: BoxDecoration(
                          color: Colors.yellow.shade300,
                          border: Border.all(
                              color: Colors.black,
                              width: 4.0,
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ), //Box

                        height: 250,
                        width: 170,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        child: Column(children: [
                          Text(
                            "VÜCUT KİTLE",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25),
                          ),
                          Text(
                            "İNDEKSİ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25),
                          ),
                          Padding(
                              padding: EdgeInsets.only(top: 60),
                              child: Text(
                                "${vkihesapla(map["boy"], map["kilo"]).toInt().toString()} BMI",
                                style: TextStyle(fontSize: 46),
                              ))
                        ]),
                        decoration: BoxDecoration(
                          color: Colors.yellow.shade300,
                          border: Border.all(
                              color: Colors.black,
                              width: 4.0,
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ), //Box

                        height: 250,
                        width: 170,
                      ),
                      Container(
                        child: Column(children: [
                          Text(
                            "ŞİŞMANLIK",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25),
                          ),
                          Text(
                            "DURUMU",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25),
                          ),
                          Padding(
                              padding: EdgeInsets.only(top: 60),
                              child: Text(
                                sismanlikOlcer(
                                    vkihesapla(map["boy"], map["kilo"])),
                                style: TextStyle(fontSize: 20),
                              ))
                        ]),
                        decoration: BoxDecoration(
                          color: Colors.yellow.shade300,
                          border: Border.all(
                              color: Colors.black,
                              width: 4.0,
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ), //Box

                        height: 250,
                        width: 170,
                      ),
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
