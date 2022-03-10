import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;

import '../models/centres.dart';
import '../models/launchers.dart';
import '../models/satellites.dart';
import '../models/spacecrafts.dart';

String url = "https://isro.vercel.app/api/";

Future<CentreList> getCentreList() async {
  final response = await http.get(Uri.parse(url + "centres"));
  return CentreList.fromJson(jsonDecode(response.body));
}

Future<LaunchersList> getLaunchersList() async {
  final response = await http.get(Uri.parse(url + "launchers"));
  return LaunchersList.fromJson(jsonDecode(response.body));
}

Future<SatelliteList> getSatelliteList() async {
  final response = await http.get(Uri.parse(url + "customer_satellites"));
  return SatelliteList.fromJson(jsonDecode(response.body));
}

Future<SpacecraftList> getSpacecraftsList() async {
  final response = await http.get(Uri.parse(url + "spacecrafts"));
  return SpacecraftList.fromJson(jsonDecode(response.body));
}

Future<bool> checkConnectivity() async {
  var connectivityResult = await Connectivity().checkConnectivity();
  if (connectivityResult == ConnectivityResult.mobile) {
    return true;
  } else if (connectivityResult == ConnectivityResult.wifi) {
    return true;
  }
  return false;
}
