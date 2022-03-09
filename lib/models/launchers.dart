class LaunchersList {
  List<Launchers>? launchers;

  LaunchersList({this.launchers});

  LaunchersList.fromJson(Map<String, dynamic> json) {
    if (json['launchers'] != null) {
      launchers = <Launchers>[];
      json['launchers'].forEach((v) {
        launchers!.add(new Launchers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.launchers != null) {
      data['launchers'] = this.launchers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Launchers {
  String? id;

  Launchers({this.id});

  Launchers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    return data;
  }
}
