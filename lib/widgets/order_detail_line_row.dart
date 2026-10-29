import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mama_put/models/order_line.dart';
import 'package:mama_put/utils/format_naira.dart';

class OrderDetailLineRow extends StatelessWidget {
  const OrderDetailLineRow({super.key, required this.line});

  final OrderLine line;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 12,
      children: [
        Container(
          height: 50,
          width: 50,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: const Color(0xFFFDEBD3),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(line.item.emoji, style: const TextStyle(fontSize: 28)),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                line.item.name,
                style: GoogleFonts.poppins(
                  color: const Color(0xFF2B2B2B),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                '${line.qty} × ${formatNaira(line.item.price)}',
                style: GoogleFonts.poppins(
                  color: const Color(0xFF8A8A8A),
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        Text(
          formatNaira(line.subtotal),
          style: GoogleFonts.poppins(
            color: const Color(0xFF2B2B2B),
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
