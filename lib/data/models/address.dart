import 'dart:convert';

import 'package:flutter/material.dart';

class Address {
  final String landmark;
  final String tolename;
  final String areaname;
  final int zipcode;
  final String city;
  final String district;
  final String remarks;

  Address(
      {@required this.landmark,
      @required this.tolename,
      @required this.areaname,
      @required this.zipcode,
      @required this.city,
      @required this.district,
      this.remarks});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Address &&
        other.landmark == landmark &&
        other.tolename == tolename &&
        other.areaname == areaname &&
        other.zipcode == zipcode &&
        other.city == city &&
        other.district == district &&
        other.remarks == remarks;
  }

  @override
  int get hashCode {
    return landmark.hashCode ^
        tolename.hashCode ^
        areaname.hashCode ^
        zipcode.hashCode ^
        city.hashCode ^
        district.hashCode ^
        remarks.hashCode;
  }

  Map<String, dynamic> toMap() {
    return {
      'landmark': landmark,
      'tolname': tolename,
      'areaname': areaname,
      'zipcode': zipcode,
      'city': city,
      'district': district,
      'remarks': remarks,
    };
  }

  String toJson() => json.encode(toMap());
}
