import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mama_put/models/order.dart';
import 'package:mama_put/utils/date_time_formatter.dart';
import 'package:mama_put/utils/format_naira.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({super.key, required this.order, required this.onTap});

  final Order order;
  final void Function(Order order) onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 1)),
        ],
      ),
      child: Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 10,
          children: [
            Container(
              height: 40,
              width: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Color(0xFFE3F0E8),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Icon(Icons.history),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    // width: 150,
                    child: Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                child: Text(
                                  order.orderRef,
                                  style: GoogleFonts.poppins(
                                    color: Color(0xFF2B2B2B),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              SizedBox(
                                child: Text(
                                  formatDateTime(order.dateTime),
                                  style: GoogleFonts.poppins(
                                    color: Color(0xFF2B2B2B),
                                    fontSize: 10,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            child: Text(
                              formatNaira(order.totalOrderAmount),
                              style: GoogleFonts.poppins(
                                color: Color(0xFFE08A00),
                                fontSize: 14,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              onTap(order);
                            },
                            icon: const Icon(
                              Icons.arrow_forward_ios,
                              color: Color(0xFF2B2B2B),
                              size: 12,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
