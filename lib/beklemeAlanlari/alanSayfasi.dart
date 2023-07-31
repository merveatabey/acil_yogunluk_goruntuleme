import 'dart:js';

import 'package:acil_servis/beklemeAlanlari/alanlar.dart';
import 'package:acil_servis/beklemeAlanlari/haritalaraYonlendir.dart';
import 'package:acil_servis/home.dart';
import 'package:flutter/material.dart';

class AlanSayfasi extends StatefulWidget {
  const AlanSayfasi(String? selectedHastane, {Key? key}) : super(key: key);

  @override
  State<AlanSayfasi> createState() => _AlanSayfasiState();
}

class _AlanSayfasiState extends State<AlanSayfasi> {

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe3dff3),
      appBar: _appBar(),
      drawer: _navigationDrawer(),
      bottomNavigationBar: _navigationBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 475, top: 30),
            child: Text(
              "Sıranızı ekrandan takip edebilirsiniz !",
              style: TextStyle(
                fontFamily: "Kurale",
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: Color(0xff393ea3),
              ),
            ),
          ),
          SizedBox(height: 20,),
          HaritalaraYonlendir(),
          Expanded(child: SariYesilKirmiziAlan()),           //widgeti mümkün olan alana yayarak kullanır. genişletilmiş widget.
        ],
      ),

    );
  }

  _appBar() {
    return AppBar(
      backgroundColor: Color(0xff393ea3),
      title: Text(
        'Acil Servis Yoğunluk Görüntüleme Sistemi',
        style: TextStyle(
          fontFamily: "Kurale",
          fontSize: 20,
          fontWeight: FontWeight.w800,
          color: Colors.white,
        ),
      ),
      leading: Builder(builder: (BuildContext context) {
        return IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            tooltip: 'Menü',
            icon: Icon(Icons.menu));
      }),

      actions: [
        IconButton(
          onPressed: () {},
          tooltip: 'Ara',
          icon: Icon(Icons.search),
          padding: EdgeInsets.only(right: 5),
        ), //hastane ismi ile arama yapmaya olanak tanır.
      ],
    );
  }

  _navigationDrawer() {
    return Drawer(
      backgroundColor: Color(0xffe3dff3),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xff393ea3),
            ),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 52,
                  backgroundImage: AssetImage('images/saglık.jpeg'),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'T.C. SAĞLIK BAKANLIĞI',
                  style: TextStyle(
                    fontFamily: "Kurale",
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _navigationBar() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.white70.withOpacity(0.2),
              spreadRadius: 5, //yayılma yarıçapı
              blurRadius: 10, //bulanıklık yarıçapı
            ),
          ]),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        child: BottomNavigationBar(
          backgroundColor: Color(0xff393ea3),
          currentIndex: _currentIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          onTap: (value) {
            setState(() => _currentIndex = value);
            value == 0
                ? Navigator.push(
                context as BuildContext, MaterialPageRoute(builder: (context) => HomePage()))
                : null;
          },
          items: [
            BottomNavigationBarItem(
                label: 'Ana Menü',
                icon: Icon(
                  Icons.home_rounded,
                  size: 30,
                )),
            BottomNavigationBarItem(
                label: 'Ayarlar',
                icon: Icon(
                  Icons.settings,
                  size: 30,
                )),
          ],
        ),
      ),
    );
  }
}



