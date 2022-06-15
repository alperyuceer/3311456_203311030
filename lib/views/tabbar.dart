// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_new

import 'package:flutter/material.dart';
import 'package:vucudunu_tani/views/araclar/araclar.dart';
import 'package:vucudunu_tani/views/digerkullanicilar.dart';
import 'package:vucudunu_tani/views/menuler/menu.dart';
import 'package:vucudunu_tani/views/uyeanasayfa.dart';
import '../service/auth.dart';

class TabBarPage extends StatefulWidget {
  const TabBarPage({Key? key}) : super(key: key);

  @override
  State<TabBarPage> createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage> with TickerProviderStateMixin {
  late TabController _tabController;
  AuthService _authService = AuthService();
  void initState() {
    _tabController = new TabController(length: 4, vsync: this, initialIndex: 0);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        bottomNavigationBar: BottomAppBar(
          child: TabBar(controller: _tabController, isScrollable: false, tabs: [
            Tab(
                icon: Icon(
              Icons.home,
              color: Colors.indigo,
            )),
            Tab(
              icon: Text(
                "ARAÇLAR",
                style: TextStyle(color: Colors.indigo),
              ),
            ),
            Tab(
              icon: Text(
                "DİĞER ÜYELER",
                style: TextStyle(color: Colors.indigo),
              ),
            ),
            Tab(
              icon: Text(
                "MENÜ",
                style: TextStyle(color: Colors.indigo),
              ),
            )
          ]),
        ),
        body: TabBarView(
            controller: _tabController,
            physics: NeverScrollableScrollPhysics(),
            children: [
              UyeAnaSayfaPage(),
              AraclarPage(),
              DigerKullanicilarPage(),
              MenuPage(),
            ]),
      ),
    );
  }
}
