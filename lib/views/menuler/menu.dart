// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:vucudunu_tani/views/giris_yada_kayit.dart';
import 'package:vucudunu_tani/views/menuler/hakkimizda.dart';
import 'package:vucudunu_tani/views/menuler/iletisim.dart';
import 'package:vucudunu_tani/service/auth.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  AuthService _authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: Icon(Icons.sports_martial_arts_rounded),
            pinned: true,
            floating: true,
            expandedHeight: 160.0,
            flexibleSpace: FlexibleSpaceBar(
                title: Text('VÜCUDUNU TANI'),
                background: Image.asset(
                  "assets/images/loginorsignup.jpg",
                  fit: BoxFit.cover,
                )),
          ),
          SliverToBoxAdapter(
            child: InkWell(
              onTap: (() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HakkimdaPage(),
                    ));
              }),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    child: Center(
                      child: Text(
                        "HAKKIMIZDA",
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                    height: 100,
                    color: Colors.yellow.shade300,
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: InkWell(
              onTap: (() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => IletisimPage(),
                    ));
              }),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    child: Center(
                      child: Text(
                        "İLETİŞİM",
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                    height: 100,
                    color: Colors.yellow.shade300,
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: InkWell(
              onTap: (() {
                _authService.signOut();

                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GirisYaDaKayitPage(),
                    ));
              }),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    child: Center(
                      child: Text(
                        "ÇIKIŞ YAP",
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                    height: 100,
                    color: Colors.yellow.shade300,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
