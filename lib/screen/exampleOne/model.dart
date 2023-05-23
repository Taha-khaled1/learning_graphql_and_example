class QueryModel {
  final Info company;
  final Roadster roadster;

  QueryModel({required this.company, required this.roadster});

  factory QueryModel.fromJson(Map<String, dynamic> json) {
    return QueryModel(
      company: Info.fromJson(json['company']),
      roadster: Roadster.fromJson(json['roadster']),
    );
  }
}

class Info {
  final String ceo;

  Info({required this.ceo});

  factory Info.fromJson(Map<String, dynamic> json) {
    return Info(
      ceo: json['ceo'],
    );
  }
}

class Roadster {
  final double apoapsis;

  Roadster({required this.apoapsis});

  factory Roadster.fromJson(Map<String, dynamic> json) {
    return Roadster(
      apoapsis: json['apoapsis_au'].toDouble(),
    );
  }
}
