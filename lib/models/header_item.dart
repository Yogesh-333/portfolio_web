import 'package:flutter/material.dart';

class HeaderItem {
  final String title;
  final VoidCallback onTap;
  final bool isButton;
  final GlobalKey Gkey;

  HeaderItem({
    required this.title,
    required this.onTap,
    this.isButton = false,
    required this.Gkey,
  });
}
