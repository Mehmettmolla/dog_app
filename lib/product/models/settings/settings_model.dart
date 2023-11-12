import 'package:flutter/material.dart';

class SettingsModel {
  final String? icon;
  final String? title;
  final bool? isDivider;
  final Widget? child;

  SettingsModel({this.icon, this.title, this.isDivider = true, this.child});
}
