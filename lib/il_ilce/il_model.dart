class Il {
  final String ilAdi;
  final List<Ilce> ilceler;

  Il({
    required this.ilAdi,
    required this.ilceler,
  });

  factory Il.fromJson(Map<String, dynamic> json) {
    var ilcelerJson = json['ilceler'] as List<dynamic>;
    var ilcelerList = ilcelerJson.map((ilceJson) => Ilce.fromJson(ilceJson)).toList();

    return Il(
      ilAdi: json['ilAdi'] as String,
      ilceler: ilcelerList,
    );
  }
}

class Ilce {
  final String ilceAdi;
  final List<Hastane> hastaneler;

  Ilce({
    required this.ilceAdi,
    required this.hastaneler,
  });

  factory Ilce.fromJson(Map<String, dynamic> json) {
    var hastanelerJson = json['hastaneler'] as List<dynamic>;
    var hastanelerList = hastanelerJson.map((hastaneJson) => Hastane.fromJson(hastaneJson)).toList();

    return Ilce(
      ilceAdi: json['ilceAdi'] as String,
      hastaneler: hastanelerList,
    );
  }
}

class Hastane {
  final String hastaneAdi;

  Hastane({
    required this.hastaneAdi,
  });

  factory Hastane.fromJson(String json) {
    return Hastane(
      hastaneAdi: json,
    );
  }

}
