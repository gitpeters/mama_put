// stateful - holds only selectedCategory

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mama_put/data/menu_items.dart';
import 'package:mama_put/models/menu_item.dart';
import 'package:mama_put/models/order_line.dart';
import 'package:mama_put/utils/day.dart';
import 'package:mama_put/utils/format_naira.dart';
import 'package:mama_put/widgets/category_chip.dart';
import 'package:mama_put/widgets/menu_item_card.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({
    super.key,
    required this.cart,
    required this.onAdd,
    required this.onRemove,
    required this.placeOrder,
  });

  final Map<String, int> cart;

  final void Function(MenuItem item) onAdd;
  final void Function(MenuItem item) onRemove;
  final void Function(List<OrderLine> orderLines) placeOrder;

  @override
  State<MenuScreen> createState() {
    return _MenuScreenState();
  }
}

class _MenuScreenState extends State<MenuScreen> {
  final List<String> menuCategories = menuItems
      .map((item) {
        return item.category;
      })
      .toSet()
      .toList();

  List<MenuItem> items = [];
  String activeCategory = 'All';

  void selectCategory(String category) {
    setState(() {
      activeCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    final cart = widget.cart;
    final itemCount = cart.values.fold(0, (sum, qty) => sum + qty);

    if (activeCategory == 'All') {
      items = menuItems;
    } else {
      items = menuItems
          .where((item) => item.category == activeCategory)
          .toList();
    }

    int subtotal = 0;
    for (final item in menuItems) {
      subtotal += item.price * (cart[item.id] ?? 0);
    }

    final lines = menuItems
        .where((item) => cart.containsKey(item.id))
        .map((item) => OrderLine(item: item, qty: cart[item.id] ?? 0))
        .toList();

    return SizedBox(
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(vertical: 40),
        child: Column(
          spacing: 10.0,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              spacing: 10.0,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Good ${getTimeOfDay()}',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    color: Color(0xFF2B2B2B),
                  ),
                ),
                Icon(Icons.waving_hand_sharp, color: Color(0xFFE08A00)),
              ],
            ),
            Text(
              'What are you eating today?',
              style: GoogleFonts.poppins(
                fontSize: 28,
                fontWeight: FontWeight.w900,
                color: Color(0xFF2B2B2B),
              ),
            ),
            SizedBox(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: 8,
                  children: ['All', ...menuCategories].map((category) {
                    return CategoryChip(
                      label: category,
                      isSelected: activeCategory == category,
                      onTap: () => selectCategory(category),
                    );
                  }).toList(),
                ),
              ),
            ),
            SizedBox(
              height: 450,
              child: SingleChildScrollView(
                child: Column(
                  spacing: 10,
                  children: items
                      .map(
                        (item) => MenuItemCard(
                          item: item,
                          qty: cart[item.id] ?? 0,
                          increaseQty: () => widget.onAdd(item),
                          decreaseQty: () => widget.onRemove(item),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
            SizedBox(
              child: Container(
                height: 90,
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Color(0xFF1E7B4F),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Padding(
                  padding: EdgeInsetsGeometry.symmetric(horizontal: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    spacing: 8,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            child: Text(
                              '$itemCount items',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          SizedBox(
                            child: Text(
                              formatNaira(subtotal),
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      OutlinedButton.icon(
                        iconAlignment: IconAlignment.end,
                        onPressed: cart.isEmpty
                            ? null
                            : () => widget.placeOrder(lines),
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Color(0xFFFFF8F0),
                          foregroundColor: Color(0xFF1E7B4F),
                          disabledBackgroundColor: const Color(0xFFFFF8F0)
                              .withValues(alpha: 0.5),
                          disabledForegroundColor: const Color(0xFF1E7B4F)
                              .withValues(alpha: 0.5),
                          side: BorderSide.none,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(14)),
                          ),
                          // padding: EdgeInsets.all(15),
                          fixedSize: Size(160, 20),
                        ),
                        label: Text(
                          "Review order",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        icon: Icon(
                          Icons.arrow_right_alt,
                          size: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
