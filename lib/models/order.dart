import 'package:mama_put/models/order_line.dart';

class Order {
  const Order({
    required this.orderNum, 
    required this.orderRef,
    required this.totalOrderAmount,
    required this.orderLines,
    required this.dateTime
    });
  
  final int orderNum;
  final String orderRef;
  final int totalOrderAmount;
  final List<OrderLine> orderLines;
  final DateTime dateTime;
}