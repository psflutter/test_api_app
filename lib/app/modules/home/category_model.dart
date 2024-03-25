class Categores {
  String? aPI;
  String? description;
  String? auth;
  bool? hTTPS;
  String? cors;
  String? link;
  String? category;

  Categores(
      {this.aPI,
      this.description,
      this.auth,
      this.hTTPS,
      this.cors,
      this.link,
      this.category});

  Categores.fromJson(Map<String, dynamic> json) {
    aPI = json['API'];
    description = json['Description'];
    auth = json['Auth'];
    hTTPS = json['HTTPS'];
    cors = json['Cors'];
    link = json['Link'];
    category = json['Category'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['API'] = aPI;
    data['Description'] = description;
    data['Auth'] = auth;
    data['HTTPS'] = hTTPS;
    data['Cors'] = cors;
    data['Link'] = link;
    data['Category'] = category;
    return data;
  }
}
