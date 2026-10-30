import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mama_put/models/order_line.dart';
import 'package:mama_put/widgets/order_line_row.dart';
import 'package:mama_put/utils/format_naira.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen({
    super.key,
    required this.orderLines,
    required this.onBack,
    required this.onEdit,
    required this.onOrderSubmit,
  });

  final List<OrderLine> orderLines;
  final void Function(List<OrderLine> lines) onBack;
  final void Function(List<OrderLine> lines) onEdit;
  final void Function(int total) onOrderSubmit;

  @override
  Widget build(BuildContext context) {
    final subtotal = orderLines.fold(0, (sum, line) => sum + line.subtotal);
    final int deliveryFee = subtotal > 15000 ? 0 : 800;
    final int total = subtotal + deliveryFee;
    final String deliveryFeeTxt = deliveryFee > 0
        ? formatNaira(deliveryFee)
        : 'Free';

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
                  children: [
                    IconButton(
                      onPressed: () {
                        onBack(orderLines);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Color(0xFF2B2B2B),
                      ),
                    ),
                    Text(
                      'Your order',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
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
                  child: SizedBox(
                    height: 300,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 13,
                        children: [
                          for (var i = 0; i < orderLines.length; i++) ...[
                            OrderLineRow(line: orderLines[i]),
                            if (i < orderLines.length - 1)
                              const Divider(
                                height: 1,
                                thickness: 1,
                                color: Color(0xFFF1E8DD),
                              ),
                          ],
                        ],
                      ),
                    ),
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
                              'Subtotal',
                              style: GoogleFonts.poppins(
                                color: Color(0xFF2B2B2B),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),

                          SizedBox(
                            child: Text(
                              formatNaira(subtotal),
                              style: GoogleFonts.poppins(
                                color: Color(0xFF2B2B2B),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            child: Text(
                              'Delivery',
                              style: GoogleFonts.poppins(
                                color: Color(0xFF2B2B2B),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),

                          SizedBox(
                            child: Text(
                              deliveryFeeTxt,
                              style: GoogleFonts.poppins(
                                color: Color(0xFF2B2B2B),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: List.generate(30, (index) {
                          return Expanded(
                            child: Container(
                              height: 1.5,
                              margin: const EdgeInsets.symmetric(horizontal: 2),
                              color: const Color(0xFFE5D9CB),
                            ),
                          );
                        }),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            child: Text(
                              'Total',
                              style: GoogleFonts.poppins(
                                color: Color(0xFF2B2B2B),
                                fontSize: 18,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),

                          SizedBox(
                            child: Text(
                              formatNaira(total),
                              style: GoogleFonts.poppins(
                                color: Color(0xFF2B2B2B),
                                fontSize: 18,
                                fontWeight: FontWeight.w900,
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
                  onPressed: () {
                    onEdit(orderLines);
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Color(0xFF1E7B4F),
                    side: BorderSide(color: Color(0xFF1E7B4F), width: 1.8),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(14)),
                    ),
                    // padding: EdgeInsets.all(15),
                    minimumSize: const Size.fromHeight(60)
                  ),
                  child: Text(
                    "Edit order",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                OutlinedButton(
                  onPressed: () {
                    onOrderSubmit(total);
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Color(0xFF1E7B4F),
                    foregroundColor: Colors.white,
                    side: BorderSide.none,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(14)),
                    ),
                    // padding: EdgeInsets.all(15),
                    minimumSize: const Size.fromHeight(60)
                  ),
                  child: Text(
                    'Place order • ${formatNaira(total)}',
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
}
