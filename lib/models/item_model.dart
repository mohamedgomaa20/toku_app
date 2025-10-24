class Item {
  final String? imagePath;
  final String sound;
  final String jpName;
  final String enName;

  const Item({
    this.imagePath,
    required this.jpName,
    required this.enName,
    required this.sound,
  });
}
