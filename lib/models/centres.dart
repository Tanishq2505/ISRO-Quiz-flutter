class CentreList {
  List<Centres>? centres;

  CentreList({this.centres});

  CentreList.fromJson(Map<String, dynamic> json) {
    if (json['centres'] != null) {
      centres = <Centres>[];
      json['centres'].forEach((v) {
        centres!.add(new Centres.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.centres != null) {
      data['centres'] = this.centres!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Centres {
  int? id;
  String? name;
  String? place;
  String? state;

  Centres({this.id, this.name, this.place, this.state});

  Centres.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    place = json['Place'];
    state = json['State'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['Place'] = this.place;
    data['State'] = this.state;
    return data;
  }
}
