import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mama_put/models/order.dart';
import 'package:mama_put/utils/format_naira.dart';
import 'package:mama_put/widgets/order_detail_line_row.dart';

class OrderDetailScreen extends StatelessWidget {
  const OrderDetailScreen({
    super.key,
    required this.order,
    required this.onBackBtn,
  });

  final Order? order;
  final void Function() onBackBtn;

  @override
  Widget build(BuildContext context) {
    bool orderFound = order != null;
    if (orderFound) {
      Order foundOrder = order !;
      return SizedBox(
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(vertical: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: onBackBtn,
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Color(0xFF2B2B2B),
                          ),
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
                    SizedBox(
                            child: Text(
                              foundOrder.orderRef,
                              style: GoogleFonts.poppins(
                                color: Color(0xFF2B2B2B),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 13,
                        children: [
                          for (var i = 0; i < foundOrder.orderLines.length; i++) ...[
                            OrderDetailLineRow(line: foundOrder.orderLines[i]),
                            if (i < foundOrder.orderLines.length - 1)
                              const Divider(
                                height: 1,
                                thickness: 1,
                                color: Color(0xFFF1E8DD),
                              ),
                          ],
                        ],
                      ),
                ),
                Padding(
                  padding: EdgeInsetsGeometry.all(12),
                  child: Column(
                    spacing: 14,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 16,
                        children: [
                          SizedBox(
                            child: Text(
                              'Total',
                              style: GoogleFonts.poppins(
                                color: Color(0xFF2B2B2B),
                                fontSize: 14,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),

                          SizedBox(
                            child: Text(
                              formatNaira(foundOrder.totalOrderAmount),
                              style: GoogleFonts.poppins(
                                color: Color(0xFF2B2B2B),
                                fontSize: 14,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              spacing: 15,
              children: [
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Color(0xFF1E7B4F),
                    side: BorderSide(color: Color(0xFF1E7B4F), width: 1.8),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(14)),
                    ),
                    // padding: EdgeInsets.all(15),
                    fixedSize: Size(370, 60),
                  ),
                  child: Text(
                    "Print",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
    }
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(vertical: 80),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 10,
        children: [
          Container(
            width: 110,
            height: 110,
            decoration: const BoxDecoration(
              color: Color(0xFFE3F0E8),
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Container(
              width: 76,
              height: 76,
              decoration: const BoxDecoration(
                color: Color(0xFF1E7B4F),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.search_off,
                color: Colors.white,
                size: 44,
              ),
            ),
          ),
          SizedBox(
            child: Text(
              'No Order found!',
              style: GoogleFonts.poppins(
                fontSize: 38,
                fontWeight: FontWeight.w900,
                color: Color(0xFF2B2B2B),
              ),
            ),
          ),
        ],
      ),
    );
  } 
}
