import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HaritalaraYonlendir extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: (){
          _openGoogleMaps();
        },
        child: Text('Nasıl Giderim ?',
          style: TextStyle(
              fontFamily: "Kurale",
              fontSize: 16,
              fontWeight: FontWeight.bold),),
        style: ElevatedButton.styleFrom(backgroundColor: Color(0xff393ea3), minimumSize: Size(115, 45)),

      ),

    );
  }


  void _openGoogleMaps() async{
    String googleMapsUrl = 'https://www.google.com/maps/search/?api=1';
    if (await canLaunch(googleMapsUrl)) {         //belirtilen urli açabilmeyi kontrol ediyoruz
      await launch(googleMapsUrl);
      print('yönlendirme yapılıyor');
    } else {
      throw 'Google Haritalar açılamadı';
    }

  }
}
