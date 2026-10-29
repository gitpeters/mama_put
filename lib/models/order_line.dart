import 'package:mama_put/models/menu_item.dart';

class OrderLine {
  const OrderLine({required this.item, required this.qty});

  final MenuItem item;
  final int qty;

  int get subtotal => item.price * qty;
}