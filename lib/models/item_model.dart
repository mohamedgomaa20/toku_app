import 'package:flutter/cupertino.dart';

class Item {
  final String? imagePath;
  final String sound;
  final String jpName;
  final String enName;

  const Item({
    @required this.imagePath,
    required this.jpName,
    required this.enName,
    required this.sound,
  });
}
