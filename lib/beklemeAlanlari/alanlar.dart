import 'package:acil_servis/beklemeAlanlari/alan.dart';
import 'package:flutter/material.dart';
class SariYesilKirmiziAlan extends StatelessWidget {
  final alanListesi = Alan.alanOlustur();


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(80),
      child: GridView.builder(
      itemCount: alanListesi.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(      //dörtlü yerleşimin aralıklarını belirliyor.
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) => alanListesi[index].isLast!
              ? null
              : _buildAlan(context, alanListesi[index])),
    );
  }

  Widget _buildAlan(BuildContext context, Alan alan){
    return Container(
      height: 20,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: alan.alanRengi,
        borderRadius: BorderRadius.circular(20),
    ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
            Icon(
              alan.iconData,
              color: alan.iconColor,
              size: 40,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              alan.alanAdi!,
              style: TextStyle(
                  fontFamily: "Kurale",
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
              color: Colors.white),
            ),
            SizedBox(
              height: 40,
            ),
        ],
      ),
    );
  }
}
