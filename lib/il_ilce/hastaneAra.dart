import 'dart:convert';
import 'package:flutter/material.dart';

class HastaneAra extends StatefulWidget {
  @override
  State<HastaneAra> createState() => _HastaneAraState();
}


class _HastaneAraState extends State<HastaneAra> {
  List<dynamic> searchData =[];       //arama sonuçlarını tutacak liste
TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    searchInJson();
  }

  //arama yapacak fonksiyon
  void searchInJson() async{
    String jsonData = await DefaultAssetBundle.of(context).loadString('assets/il_ilce.json');
    var data = json.decode(jsonData);             //json verilerini dönüştür
    String search = controller.text;
    List<dynamic> sonuc = [];

    for (var item in data){
      if(item['hastaneAdi'].contains(search)){
        sonuc.add(item);
      }
    }
    print('arama sonucu : $sonuc');
    setState(() {
      searchData = sonuc;       //arama sonuçlarını güncelle
    });
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(padding: EdgeInsets.all(8.0),
        child: TextField(
          controller: controller,
          onSubmitted: (value) => searchInJson(),
          decoration: InputDecoration(
            labelText: 'Arama',
            suffixIcon: IconButton(
              icon: Icon(Icons.search),
              onPressed:(){
                controller.clear();
                searchInJson();
              }

                ),
    ),
    ),
    ),

        Expanded(child: ListView.builder(
            itemCount: searchData.length,
            itemBuilder: (context, index){
          return ListTile(
            title: Text(searchData[index]['hastaneAdi']),
            subtitle: Text(searchData[index]['il']),
          );
    }),
        ),
      ],
    );
  }
}




