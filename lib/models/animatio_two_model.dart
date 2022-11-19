import 'package:flutter/material.dart';

abstract class ListItem {
  final String title;
  final String description;
  final IconData icon;
  final Widget image;

  ListItem(
      {required this.title,
      required this.description,
      required this.icon,
      required this.image});
}

class ListTitle extends ListItem {
  ListTitle(
      {required super.title,
      required super.description,
      required super.icon,
      required super.image});
}
