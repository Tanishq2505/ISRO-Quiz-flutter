class SatelliteList {
  List<CustomerSatellites>? customerSatellites;

  SatelliteList({this.customerSatellites});

  SatelliteList.fromJson(Map<String, dynamic> json) {
    if (json['customer_satellites'] != null) {
      customerSatellites = <CustomerSatellites>[];
      json['customer_satellites'].forEach((v) {
        customerSatellites!.add(new CustomerSatellites.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.customerSatellites != null) {
      data['customer_satellites'] =
          this.customerSatellites!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CustomerSatellites {
  String? id;
  String? country;
  String? launchDate;
  String? mass;
  String? launcher;

  CustomerSatellites(
      {this.id, this.country, this.launchDate, this.mass, this.launcher});

  CustomerSatellites.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    country = json['country'];
    launchDate = json['launch_date'];
    mass = json['mass'];
    launcher = json['launcher'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['country'] = this.country;
    data['launch_date'] = this.launchDate;
    data['mass'] = this.mass;
    data['launcher'] = this.launcher;
    return data;
  }
}
