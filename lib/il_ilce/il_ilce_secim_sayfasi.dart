
import 'package:flutter/material.dart';
import 'dart:convert';

import '../beklemeAlanlari/alanSayfasi.dart';


class IlIlceSecimSayfasi extends StatefulWidget {
  @override
  State<IlIlceSecimSayfasi> createState() => _IlIlceSecimSayfasiState();
}

class _IlIlceSecimSayfasiState extends State<IlIlceSecimSayfasi> {
  String? selectedIl;
  String? selectedIlce;
  String? selectedHastane;
  List<String> iller = [];
  List<String> ilceler = [];
  List<String> hastaneler = [];

  void initState() {
    super.initState();
    loadIlIlceData();
  }

  void loadIlIlceData() async {
    String jsonStr =
    await DefaultAssetBundle.of(context).loadString('assets/il_ilce.json');
    Map<String, dynamic> jsonData = json.decode(jsonStr);
    setState(() {
      iller = List<String>.from(jsonData['iller'].map((il) => il['ilAdi']));
    });
  }

  void loadIlceler(String il) async {
    String jsonStr =
    await DefaultAssetBundle.of(context).loadString('assets/il_ilce.json');
    Map<String, dynamic> jsonData = json.decode(jsonStr);
    for (var ilData in jsonData['iller']) {
      if (ilData['ilAdi'] == il) {
        setState(() {
          ilceler = List<String>.from(ilData['ilceler'].map((ilce) => ilce['ilceAdi']));
          selectedIlce = null; // Seçili il değiştiğinde ilçe seçimini sıfırla
          selectedHastane = null;
        });
        break;
      }
    }
  }

  void loadHastaneler(String ilce) async {
    String jsonStr = await DefaultAssetBundle.of(context).loadString('assets/il_ilce.json');
    Map<String, dynamic> jsonData = json.decode(jsonStr);

    for (var ilData in jsonData['iller']) {
      for (var ilceData in ilData['ilceler']) {
        if (ilceData['ilceAdi'] == ilce) {
          setState(() {
            selectedIlce = ilce;
            hastaneler = List<String>.from(ilceData['hastaneler'].map((hastane) => hastane['hastaneAdi']));
            selectedHastane = null;
          });
          return;
        }
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 140,
          ),
          DropdownButton<String>(
            value: selectedIl,
            hint: Text('İl Seçin'),
            onChanged: (String? newValue) {
              setState(() {
                selectedIl = newValue;
                selectedIlce =
                null; // Seçili il değiştiğinde ilçe seçimini sıfırla
                loadIlceler(newValue!);
              });
            },
            items: iller.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          SizedBox(height: 20),
          DropdownButton<String>(
            value: selectedIlce,
            hint: Text('İlçe Seçin'),
            onChanged: (String? newValue) {
              setState(() {
                selectedIlce = newValue;
                selectedHastane = null;
                loadHastaneler(newValue!);
              });
            },
            items: ilceler.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          SizedBox(
            height: 20,
          ),

           DropdownButton<String>(
             value: selectedHastane,
             hint: Text('Hastane Seçiniz'),
             onChanged: (String? newValue) {
               setState(() {
                 if(selectedIlce != null){
                   selectedHastane = newValue;
                 }
                else{
                  print('burada bir sıkıntı var');
                 }
               });
             },
             items: hastaneler.map<DropdownMenuItem<String>>((String value) {
               return DropdownMenuItem<String>(
                 value: value,
                 child: Text(value),
               );
             }).toList(),
           ),
          SizedBox(height: 80,),
          FilledButton(onPressed: (){_ileriButonu();},
            child: Center(
                child: Text(
                  'İleri',
                  style: TextStyle(
                    fontFamily: "Kurale",
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: Color(0xff393ea3),
                  ),
                )
            ),
            style: ButtonStyle(
              backgroundColor:
              MaterialStatePropertyAll<Color>(Colors.green),
              fixedSize: MaterialStatePropertyAll(Size(280, 50)),
            ),)

        ],
      ),
    );
  }

  _ileriButonu(){
    if(selectedIl != null && selectedIlce !=null && selectedHastane != null){
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => AlanSayfasi(selectedHastane)));
      print('seçilen hastane verileri karşınıza gelecektir : $selectedHastane');

    }

  }
}




