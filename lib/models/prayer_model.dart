// To parse this JSON data, do
//
//     final prayer = prayerFromJson(jsonString);

import 'dart:convert';

Prayer prayerFromJson(String str) => Prayer.fromJson(json.decode(str));

String prayerToJson(Prayer data) => json.encode(data.toJson());

class Prayer {
  String? city;
  String? slug;
  String? country;
  String? countrySlug;
  double? latitude;
  double? longitude;
  String? timezone;
  double? qiblaDegreesFromNorth;
  String? method;
  String? authority;
  String? madhab;
  DateTime? generated;
  String? license;
  String? source;
  List<String>? fields;
  List<Day>? days;

  Prayer({
    this.city,
    this.slug,
    this.country,
    this.countrySlug,
    this.latitude,
    this.longitude,
    this.timezone,
    this.qiblaDegreesFromNorth,
    this.method,
    this.authority,
    this.madhab,
    this.generated,
    this.license,
    this.source,
    this.fields,
    this.days,
  });

  factory Prayer.fromJson(Map<String, dynamic> json) => Prayer(
        city: json["city"],
        slug: json["slug"],
        country: json["country"],
        countrySlug: json["country_slug"],
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        timezone: json["timezone"],
        qiblaDegreesFromNorth: json["qibla_degrees_from_north"]?.toDouble(),
        method: json["method"],
        authority: json["authority"],
        madhab: json["madhab"],
        generated: json["generated"] == null
            ? null
            : DateTime.parse(json["generated"]),
        license: json["license"],
        source: json["source"],
        fields: json["fields"] == null
            ? []
            : List<String>.from(json["fields"]!.map((x) => x)),
        days: json["days"] == null
            ? []
            : List<Day>.from(json["days"]!.map((x) => Day.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "city": city,
        "slug": slug,
        "country": country,
        "country_slug": countrySlug,
        "latitude": latitude,
        "longitude": longitude,
        "timezone": timezone,
        "qibla_degrees_from_north": qiblaDegreesFromNorth,
        "method": method,
        "authority": authority,
        "madhab": madhab,
        "generated": generated?.toIso8601String(),
        "license": license,
        "source": source,
        "fields":
            fields == null ? [] : List<dynamic>.from(fields!.map((x) => x)),
        "days": days == null
            ? []
            : List<dynamic>.from(days!.map((x) => x.toJson())),
      };
}

class Day {
  DateTime? date;
  String? imsak;
  String? fajr;
  String? sunrise;
  String? dhuhr;
  String? asr;
  String? maghrib;
  String? isha;

  Day({
    this.date,
    this.imsak,
    this.fajr,
    this.sunrise,
    this.dhuhr,
    this.asr,
    this.maghrib,
    this.isha,
  });

  factory Day.fromJson(Map<String, dynamic> json) => Day(
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        imsak: json["imsak"],
        fajr: json["fajr"],
        sunrise: json["sunrise"],
        dhuhr: json["dhuhr"],
        asr: json["asr"],
        maghrib: json["maghrib"],
        isha: json["isha"],
      );

  Map<String, dynamic> toJson() => {
        "date": date == null
            ? null
            : "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "imsak": imsak,
        "fajr": fajr,
        "sunrise": sunrise,
        "dhuhr": dhuhr,
        "asr": asr,
        "maghrib": maghrib,
        "isha": isha,
      };
}
