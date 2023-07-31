import 'package:acil_servis/home.dart';
import 'package:flutter/material.dart';

class GirisSayfasi extends StatefulWidget {
  const GirisSayfasi({Key? key}) : super(key: key);

  @override
  State<GirisSayfasi> createState() => _GirisSayfasiState();
}

class _GirisSayfasiState extends State<GirisSayfasi> {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe3dff3),
      appBar: AppBar(
        backgroundColor: Color(0xff393ea3),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 100,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
                child: CircleAvatar(
                  radius: 120.0,
                  backgroundImage: AssetImage('images/saglık.jpeg'),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "T.C. Sağlık Bakanlığı Acil Servis Sistemine Hoşgeldiniz..",
                style: TextStyle(
                    fontFamily: "Kurale",
                    //height: 2,
                    fontSize: 30,
                    color: Color(0xff393ea3),
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
