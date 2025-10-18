import 'package:flutter/cupertino.dart';

class CategoryModel {
  final String title;
  final String subtitle;
  final Color color;
  final IconData icon;
  final Widget widget;

  const CategoryModel({
    required this.title,
    required this.subtitle,
    required this.color,
    required this.icon,
    required this.widget,
  });
}
