class MenuItem {
  const MenuItem({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.price,
    required this.emoji,
    this.isPopular = false,
  });

  final String id;
  final String name;
  final String description;
  final String category;
  final int price;
  final String emoji;
  final bool isPopular;
}