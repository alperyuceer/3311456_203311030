// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DigerKullanicilarPage extends StatefulWidget {
  const DigerKullanicilarPage({Key? key}) : super(key: key);

  @override
  State<DigerKullanicilarPage> createState() => _DigerKullanicilarPageState();
}

class _DigerKullanicilarPageState extends State<DigerKullanicilarPage> {
  @override
  Widget build(BuildContext context) {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    CollectionReference kullanicilarRef = _firestore.collection("Kullanicilar");

    return Scaffold(
      body: Container(
        child: StreamBuilder<QuerySnapshot>(
            stream: kullanicilarRef.snapshots(),
            builder: (BuildContext context, AsyncSnapshot asyncSnapshot) {
              if (!asyncSnapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              }
              List<DocumentSnapshot<Map<String, dynamic>>> kullaniciListesi =
                  asyncSnapshot.data.docs;

              return ListView.builder(
                  itemCount: kullaniciListesi.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.yellow.shade300,
                      child: ListTile(
                          title: Container(
                        color: Colors.yellow.shade300,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                child: Text(
                                    "${kullaniciListesi[index].data()!['ad']} ${kullaniciListesi[index].data()!['soyad']}"),
                              ),
                              Container(
                                color: Colors.green.shade200,
                                child: Text(
                                    "${kullaniciListesi[index].data()!['boy']} CM"),
                              ),
                              Container(
                                color: Colors.red.shade200,
                                child: Text(
                                    "${kullaniciListesi[index].data()!['kilo']} KG"),
                              )
                            ]),
                      )),
                      elevation: 8,
                      shadowColor: Colors.green,
                      margin: EdgeInsets.all(20),
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: Colors.green, width: 1)),
                    );
                    /* return Card(
                      color: Colors.white24,
                      child: ListTile(
                        title: Text(
                            "${kullaniciListesi[index].data()!['ad']}>>${kullaniciListesi[index].data()!['boy']} CM>>${kullaniciListesi[index].data()!['kilo']} KG"),
                      ),
                    ); */
                  });
            }),
      ),
    );
  }
}
