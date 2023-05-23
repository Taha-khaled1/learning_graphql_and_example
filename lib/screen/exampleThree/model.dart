class QueryModelThree {
  Company? company;
  List<Cores>? cores;

  QueryModelThree({this.company, this.cores});

  QueryModelThree.fromJson(Map<String, dynamic> json) {
    company =
        json['company'] != null ? Company.fromJson(json['company']) : null;
    if (json['cores'] != null) {
      cores = <Cores>[];
      json['cores'].forEach((v) {
        cores!.add(Cores.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (company != null) {
      data['company'] = company!.toJson();
    }
    if (cores != null) {
      data['cores'] = cores!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Company {
  String? ceo;
  String? coo;
  String? cto;
  String? ctoPropulsion;
  int? employees;
  Links? links;

  Company(
      {this.ceo,
      this.coo,
      this.cto,
      this.ctoPropulsion,
      this.employees,
      this.links});

  Company.fromJson(Map<String, dynamic> json) {
    ceo = json['ceo'];
    coo = json['coo'];
    cto = json['cto'];
    ctoPropulsion = json['cto_propulsion'];
    employees = json['employees'];
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ceo'] = ceo;
    data['coo'] = coo;
    data['cto'] = cto;
    data['cto_propulsion'] = ctoPropulsion;
    data['employees'] = employees;
    if (links != null) {
      data['links'] = links!.toJson();
    }
    return data;
  }
}

class Links {
  String? elonTwitter;
  String? flickr;
  String? twitter;
  String? website;

  Links({this.elonTwitter, this.flickr, this.twitter, this.website});

  Links.fromJson(Map<String, dynamic> json) {
    elonTwitter = json['elon_twitter'];
    flickr = json['flickr'];
    twitter = json['twitter'];
    website = json['website'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['elon_twitter'] = elonTwitter;
    data['flickr'] = flickr;
    data['twitter'] = twitter;
    data['website'] = website;
    return data;
  }
}

class Cores {
  int? asdsAttempts;
  String? id;
  Null? missions;

  Cores({this.asdsAttempts, this.id, this.missions});

  Cores.fromJson(Map<String, dynamic> json) {
    asdsAttempts = json['asds_attempts'];
    id = json['id'];
    missions = json['missions'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['asds_attempts'] = asdsAttempts;
    data['id'] = id;
    data['missions'] = missions;
    return data;
  }
}
