// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vucudunu_tani/service/auth.dart';
import 'package:vucudunu_tani/views/tabbar.dart';

late var response;
late var map;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;

CollectionReference kullanicilarRef = _firestore.collection("Kullanicilar");

class GirisYapPage extends StatefulWidget {
  const GirisYapPage({Key? key}) : super(key: key);

  @override
  State<GirisYapPage> createState() => _GirisYapPageState();
}

class _GirisYapPageState extends State<GirisYapPage> {
  late TextEditingController _epostaController;
  late TextEditingController _parolaController;
  @override
  void initState() {
    _epostaController = TextEditingController();
    _parolaController = TextEditingController();
    // TODO: implement initState
    super.initState();
  }

  void dispose() {
    _epostaController.dispose();
    _parolaController.dispose();
    // TODO: implement initState
    super.dispose();
  }

  AuthService _authService = AuthService();

  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 50),
              child: Image.asset(
                'assets/images/loginlogo.png',
                height: 100,
                width: 200,
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                constraints: BoxConstraints.expand(),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35),
                        topRight: Radius.circular(35))),
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      'Giriş Yap',
                      style:
                          TextStyle(fontSize: 39, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      controller: _epostaController,
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) {
                        setState(() {});
                      },
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.mail),
                          suffixIcon: _epostaController.text.isEmpty
                              ? Text('')
                              : GestureDetector(
                                  onTap: () {
                                    _epostaController.clear();
                                  },
                                  child: Icon(Icons.close)),
                          hintText: 'alperyuceer@gmail.com',
                          labelText: 'E-posta',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          )),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      obscureText: isVisible,
                      controller: _parolaController,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: GestureDetector(
                              onTap: () {
                                isVisible = !isVisible;
                                setState(() {});
                              },
                              child: Icon(isVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off)),
                          hintText: 'Parolanızı Giriniz',
                          labelText: 'Parola',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          )),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          String mevcutUyeEposta = _epostaController.text;
                          var uyeRef = _firestore
                              .collection("Kullanicilar")
                              .doc(mevcutUyeEposta);
                          response = await uyeRef.get();
                          map = response.data();
                          _authService
                              .signIn(mevcutUyeEposta, _parolaController.text)
                              .then((value) {
                            return Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TabBarPage(),
                                ));
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 10),
                          child: Text('Giriş Yap'),
                        ))
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
