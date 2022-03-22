import 'dart:convert';

AirQualityModel geoLocatorModelFromJson(String str) =>
    AirQualityModel.fromJson(json.decode(str));

String geoLocatorModelToJson(AirQualityModel data) =>
    json.encode(data.toJson());

class AirQualityModel {
  AirQualityModel({
    required this.status,
    required this.data,
  });

  final String status;
  final Data data;

  factory AirQualityModel.fromJson(Map<String, dynamic> json) =>
      AirQualityModel(
        status: json["status"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.aqi,
    required this.idx,
    required this.city,
    required this.dominentpol,
    required this.time,
    required this.debug,
    
  });

  final int aqi;
  final int idx;
  final City city;
  final String dominentpol;
  final Time time;
  final Debug debug;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        aqi: json["aqi"],
        idx: json["idx"],
        city: City.fromJson(json["city"]),
        dominentpol: json["dominentpol"],
        time: Time.fromJson(json["time"]),
        debug: Debug.fromJson(json["debug"]),
      );

  Map<String, dynamic> toJson() => {
        "aqi": aqi,
        "idx": idx,
        "city": city.toJson(),
        "dominentpol": dominentpol,
        "time": time.toJson(),
        "debug": debug.toJson(),
      };
}

class City {
  City({
    required this.geo,
    required this.name,
    required this.url,
  });

  final List<double> geo;
  final String name;
  final String url;

  factory City.fromJson(Map<String, dynamic> json) => City(
        geo: List<double>.from(json["geo"].map((x) => x.toDouble())),
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "geo": List<dynamic>.from(geo.map((x) => x)),
        "name": name,
        "url": url,
      };
}

class Debug {
  Debug({
    required this.sync,
  });

  final String sync;

  factory Debug.fromJson(Map<String, dynamic> json) => Debug(
        sync: json["sync"],
      );

  Map<String, dynamic> toJson() => {
        "sync": sync,
      };
}

class Time {
  Time({
    required this.s,
    required this.tz,
    required this.v,
    required this.iso,
  });

  final String s;
  final String tz;
  final int v;
  final String iso;

  factory Time.fromJson(Map<String, dynamic> json) => Time(
        s: json["s"],
        tz: json["tz"],
        v: json["v"],
        iso: json["iso"],
      );

  Map<String, dynamic> toJson() => {
        "s": s,
        "tz": tz,
        "v": v,
        "iso": iso,
      };
}
