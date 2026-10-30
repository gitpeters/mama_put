// stateful - activeScreen name + cart + lastOrderNumber

import 'package:flutter/material.dart';
import 'package:mama_put/data/menu_items.dart';
import 'package:mama_put/models/menu_item.dart';
import 'package:mama_put/models/order.dart';
import 'package:mama_put/models/order_line.dart';
import 'package:mama_put/screens/menu_screen.dart';
import 'package:mama_put/screens/order_detail_screen.dart';
import 'package:mama_put/screens/order_history_screen.dart';
import 'package:mama_put/screens/success_screen.dart';
import 'package:mama_put/screens/summary_screen.dart';
import 'package:mama_put/screens/welcome_screen.dart';

class MamaPut extends StatefulWidget {
  const MamaPut({super.key});

  @override
  State<MamaPut> createState() {
    return _MamaPutState();
  }
}

class _MamaPutState extends State<MamaPut> {
  String activeScreen = 'welcome-screen';

  final Map<String, int> cart = {};
  final List<Order> history = [];

  int totalOrderAmount = 0;
  int orderNum = 0;
  Order? currentOrder;

  String get orderRef => '#MP-${orderNum.toString().padLeft(4, '0')}';

  void addItem(MenuItem item) {
    setState(() {
      cart[item.id] = (cart[item.id] ?? 0) + 1;
    });
  }

  void removeItem(MenuItem item) {
    setState(() {
      final current = cart[item.id] ?? 0;
      if (current <= 1) {
        cart.remove(item.id);
      } else {
        cart[item.id] = current - 1;
      }
    });
  }

  void showSummary(List<OrderLine> lines) {
    setState(() {
      activeScreen = 'summary-screen';
    });
  }

  void showMenu() {
    setState(() {
      activeScreen = 'menu-screen';
    });
  }

  void onBack(List<OrderLine> lines) {
    setState(() {
      activeScreen = 'menu-screen';
    });
  }

  void onOrderEdit(List<OrderLine> lines) {
    setState(() {
      activeScreen = 'menu-screen';
    });
  }

  void onOrderSubmit(int total) {
    setState(() {
      totalOrderAmount = total;
      orderNum += 1;
      history.add(
        Order(
          orderNum: orderNum, 
          orderRef: orderRef, 
          totalOrderAmount: totalOrderAmount, 
          orderLines: _buildOrderLines(cart),
          dateTime: DateTime.now()
          ));
      activeScreen = 'success-screen';
    });
  }

  void startNewOrder() {
    setState(() {
      cart.clear();
      activeScreen = 'welcome-screen';
    });
  }

  void onOrderHistory() {
    setState(() {
      activeScreen = 'order-history-screen';
    });
  }

  void onOrderDetail(Order order) {
    setState(() {
      currentOrder = order;
      activeScreen = 'order-detail-screen';
    });
  }

  void onBackBtn() {
    setState(() {
      activeScreen = 'success-screen';
    });
  }

  List<OrderLine> _buildOrderLines(Map<String, int> cart) {
    return menuItems
    .where((item)=> cart.containsKey(item.id))
    .map((item) => OrderLine(item: item, qty: cart[item.id]!))
    .toList();
  }

  @override
  Widget build(BuildContext context) {
    Widget screen = WelcomeScreen(showMenu);

    if (activeScreen == 'menu-screen') {
      screen = MenuScreen(
        cart: cart,
        onAdd: addItem,
        onRemove: removeItem,
        placeOrder: showSummary,
      );
    }

    if (activeScreen == 'summary-screen') {
      screen = SummaryScreen(
        orderLines: orderLines,
        onBack: onBack,
        onEdit: onOrderEdit,
        onOrderSubmit: onOrderSubmit,
      );
    }

    if (activeScreen == 'success-screen') {
      screen = SuccessScreen(
        orderId: orderRef, 
        totalOrderAmount: totalOrderAmount, 
        onStartNewOrder: startNewOrder,
        onOrderHistory: onOrderHistory,
        );
    }

    if (activeScreen == 'order-history-screen') {
      screen = OrderHistoryScreen(
        orders: history, 
        onOrder: onOrderDetail,
        onBack: onBackBtn,
        );
    }

    if (activeScreen == 'order-detail-screen') {
      screen = OrderDetailScreen(
        order: currentOrder, 
        onBackBtn: onOrderHistory
        );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(color: Color.fromARGB(255, 252, 243, 233)),
          child: Padding(
            padding: EdgeInsetsGeometry.symmetric(vertical: 30, horizontal: 30),
            child: screen,
          ),
        ),
      ),
    );
  }
}
