import 'package:smart_admin_dashboard/core/constants/color_constants.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class DailyInfoModel {
  IconData? icon;
  String? title;
  String? totalStorage;
  int? volumeData;
  int? percentage;
  Color? color;
  List<Color>? colors;
  List<FlSpot>? spots;

  DailyInfoModel({
    this.icon,
    this.title,
    this.totalStorage,
    this.volumeData,
    this.percentage,
    this.color,
    this.colors,
    this.spots,
  });

  DailyInfoModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    volumeData = json['volumeData'];
    icon = json['icon'];
    totalStorage = json['totalStorage'];
    color = json['color'];
    percentage = json['percentage'];
    colors = json['colors'];
    spots = json['spots'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['volumeData'] = this.volumeData;
    data['icon'] = this.icon;
    data['totalStorage'] = this.totalStorage;
    data['color'] = this.color;
    data['percentage'] = this.percentage;
    data['colors'] = this.colors;
    data['spots'] = this.spots;
    return data;
  }
}

List<DailyInfoModel> dailyDatas =
    dailyData.map((item) => DailyInfoModel.fromJson(item)).toList();

//List<FlSpot> spots = yValues.asMap().entries.map((e) {
//  return FlSpot(e.key.toDouble(), e.value);
//}).toList();

var dailyData = [
  {
    "title": "Active Tickets",
    "volumeData": 34,
    "icon": FlutterIcons.list_thumbnails_fou,
    "totalStorage": "",
    "color": primaryColor,
    "percentage": 100,
    "colors": [
      Color(0xff23b6e6),
      Color(0xff02d39a),
    ],
    "spots": [
      FlSpot(
        1,
        2,
      ),
      FlSpot(
        2,
        1.0,
      ),
      FlSpot(
        3,
        1.8,
      ),
      FlSpot(
        4,
        1.5,
      ),
      FlSpot(
        5,
        1.0,
      ),
      FlSpot(
        6,
        2.2,
      ),
      FlSpot(
        7,
        1.8,
      ),
      FlSpot(
        8,
        1.5,
      )
    ]
  },
  {
    "title": "Working",
    "volumeData": 20,
    "icon": FlutterIcons.message1_ant,
    "totalStorage": "",
    "color": Color(0xFFFFA113),
    "percentage": 70,
    "colors": [Color(0xfff12711), Color(0xfff5af19)],
    "spots": [
      FlSpot(
        1,
        1.3,
      ),
      FlSpot(
        2,
        1.0,
      ),
      FlSpot(
        3,
        4,
      ),
      FlSpot(
        4,
        1.5,
      ),
      FlSpot(
        5,
        1.0,
      ),
      FlSpot(
        6,
        3,
      ),
      FlSpot(
        7,
        1.8,
      ),
      FlSpot(
        8,
        1.5,
      )
    ]
  },
  {
    "title": "Finish Tickets",
    "volumeData": 1328,
    "icon": FlutterIcons.comment_alt_faw5s,
    "totalStorage": "",
    "color": Color(0xFFA4CDFF),
    "percentage": 100,
    "colors": [Color(0xff2980B9), Color(0xff6DD5FA)],
    "spots": [
      FlSpot(
        1,
        1.3,
      ),
      FlSpot(
        2,
        5,
      ),
      FlSpot(
        3,
        1.8,
      ),
      FlSpot(
        4,
        6,
      ),
      FlSpot(
        5,
        1.0,
      ),
      FlSpot(
        6,
        2.2,
      ),
      FlSpot(
        7,
        1.8,
      ),
      FlSpot(
        8,
        1,
      )
    ]
  },
  {
    "title": "Cancel Tickets ",
    "volumeData": 1400,
    "icon": FlutterIcons.heart_faw5s,
    "totalStorage": "",
    "color": Color(0xFFd50000),
    "percentage": 100,
    "colors": [Color(0xff93291E), Color(0xffED213A)],
    "spots": [
      FlSpot(
        1,
        3,
      ),
      FlSpot(
        2,
        4,
      ),
      FlSpot(
        3,
        1.8,
      ),
      FlSpot(
        4,
        1.5,
      ),
      FlSpot(
        5,
        1.0,
      ),
      FlSpot(
        6,
        2.2,
      ),
      FlSpot(
        7,
        1.8,
      ),
      FlSpot(
        8,
        1.5,
      )
    ]
  } 
 
];

//final List<double> yValues = [
//  2.3,
//  1.8,
//  1.9,
//  1.5,
//  1.0,
//  2.2,
//  1.8,
//  1.5,
//];
