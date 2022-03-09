class SpacecraftList {
  List<Spacecrafts>? spacecrafts;

  SpacecraftList({this.spacecrafts});

  SpacecraftList.fromJson(Map<String, dynamic> json) {
    if (json['spacecrafts'] != null) {
      spacecrafts = <Spacecrafts>[];
      json['spacecrafts'].forEach((v) {
        spacecrafts!.add(new Spacecrafts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.spacecrafts != null) {
      data['spacecrafts'] = this.spacecrafts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Spacecrafts {
  int? id;
  String? name;

  Spacecrafts({this.id, this.name});

  Spacecrafts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
