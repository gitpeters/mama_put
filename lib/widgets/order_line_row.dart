import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mama_put/models/order_line.dart';
import 'package:mama_put/utils/format_naira.dart';

class OrderLineRow extends StatelessWidget {
  const OrderLineRow({super.key, required this.line});

  final OrderLine line;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 16,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              child: Text(
                line.item.name,
                style: GoogleFonts.poppins(
                  color: Color(0xFF2B2B2B),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              child: Text(
                '${line.qty} x ${formatNaira(line.item.price)}',
                style: GoogleFonts.poppins(
                  color: Color(0xFF2B2B2B),
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          child: Text(
            formatNaira(line.subtotal),
            style: GoogleFonts.poppins(
              color: Color(0xFF2B2B2B),
              fontSize: 14,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ],
    );
  }
}
