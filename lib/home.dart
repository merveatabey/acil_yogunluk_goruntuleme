import 'package:acil_servis/il_ilce/hastaneAra.dart';
import 'package:acil_servis/il_ilce/il_ilce_secim_sayfasi.dart';
import 'package:flutter/material.dart';

import 'il_ilce/customSearchDelegate.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe3dff3),
      appBar: _appBar(),
      drawer: _navigationDrawer(),
      bottomNavigationBar: _navigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation
          .centerDocked, //add butonunu navigation barın ortasına alıyoruz
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 0,
        backgroundColor: Color(0xff393ea3),
        onPressed: () {},
        child: Icon(
          Icons.add,
          size: 35,
        ),
      ),
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.center,
           children: [
             IlIlceSecimSayfasi(),
      ],
      ),
    );
  }

  _appBar() {
    return AppBar(
      backgroundColor: Color(0xff393ea3),
      title: Text(
        'Acil Servis Yoğunluk Görüntüleme Sisteme',
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
       IconButton(onPressed: (){
         showDialog(context: context, builder: (context) => AlertDialog(
           content: HastaneAra(),
         ));
          showSearch(context: context, delegate: CustomSearchDelegate());
       }, icon: Icon(Icons.search))
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
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
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
