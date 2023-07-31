import 'package:flutter/material.dart';

class Alan {
  String? alanAdi;
  IconData? iconData;
  Color? iconColor;
  Color? alanRengi;
  bool? isLast;

  Alan(
      {this.iconData,
      this.alanAdi,
      this.alanRengi,
      this.iconColor,
      this.isLast = false});

  static List<Alan> alanOlustur() {
    return [
      Alan(
        iconData: Icons.local_hospital_rounded,
        alanAdi: 'Yeşil Alan',
        iconColor: Colors.green[600],
        alanRengi: Colors.green[200],
      ),
      Alan(
        iconData: Icons.local_hospital_rounded,
        alanAdi: 'Sarı Alan',
        iconColor: Colors.yellow[600],
        alanRengi: Colors.yellow[300],
      ),
      Alan(
        iconData: Icons.local_hospital_rounded,
        alanAdi: 'Kırmızı Alan',
        iconColor: Colors.red[600],
        alanRengi: Colors.red[300],
      ),
      Alan(isLast: true)
    ];
  }
}
