import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mama_put/models/order.dart';
import 'package:mama_put/utils/date_group.dart';
import 'package:mama_put/widgets/order_item.dart';

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({
    super.key,
    required this.orders,
    required this.onOrder,
    required this.onBack,
  });

  final List<Order> orders;
  final void Function(Order order) onOrder;
  final void Function() onBack;

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final sorted = [...orders]
      ..sort((a, b) => b.dateTime.compareTo(a.dateTime));

    return Padding(
      padding: EdgeInsetsGeometry.symmetric(vertical: 40),
      child: Column(
        spacing: 10,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: onBack,
                icon: const Icon(Icons.arrow_back, color: Color(0xFF2B2B2B)),
              ),
              Text(
                'Back',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10,
                children: [
                  for (var i = 0; i < sorted.length; i++) ...[
                    if (i == 0 ||
                        dateGroupLabel(sorted[i].dateTime, now) !=
                            dateGroupLabel(sorted[i - 1].dateTime, now))
                      Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: Text(
                          dateGroupLabel(sorted[i].dateTime, now),
                          style: GoogleFonts.poppins(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF8A8A8A),
                          ),
                        ),
                      ),
                    OrderItem(order: sorted[i], onTap: onOrder),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
