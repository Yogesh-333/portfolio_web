import 'package:flutter/material.dart';

class FooterItem {
  final String iconPath;
  final String title;
  final String text1;
  final Function onTap;

  FooterItem(
      {required this.iconPath,
      required this.title,
      required this.text1,
      required this.onTap});
}
