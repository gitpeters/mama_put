import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mama_put/utils/format_naira.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({
    super.key,
    required this.orderId,
    required this.totalOrderAmount,
    required this.onStartNewOrder,
    required this.onOrderHistory,
  });

  final String orderId;
  final int totalOrderAmount;
  final void Function() onStartNewOrder;
  final void Function() onOrderHistory;

  @override
  Widget build(BuildContext context) {
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
                Icons.check_rounded,
                color: Colors.white,
                size: 44,
              ),
            ),
          ),
          SizedBox(
            child: Text(
              'Order placed!',
              style: GoogleFonts.poppins(
                fontSize: 38,
                fontWeight: FontWeight.w900,
                color: Color(0xFF2B2B2B),
              ),
            ),
          ),
          SizedBox(
            child: Text(
              'Mama don collect your order. Your food arrives in about 30 minutes',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.normal,
                color: Color(0xFF2B2B2B),
              ),
            ),
          ),
          DottedBorder(
            options: RoundedRectDottedBorderOptions(
              radius: const Radius.circular(8),
              dashPattern: const [6, 4],
              color: const Color(0xFFE5D9CB),
              strokeWidth: 1.5,
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            ),
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                'Order $orderId · ${formatNaira(totalOrderAmount)}',
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          OutlinedButton(
            onPressed: onStartNewOrder,
            style: OutlinedButton.styleFrom(
              backgroundColor: Color(0xFF1E7B4F),
              foregroundColor: Colors.white,
              side: BorderSide.none,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              // padding: EdgeInsets.all(15),
              fixedSize: Size(200, 60),
            ),
            child: Text(
              'Start a new order',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          OutlinedButton.icon(
            onPressed: onOrderHistory,
            style: OutlinedButton.styleFrom(
              foregroundColor: Color(0xFF1E7B4F),
              backgroundColor: Colors.white,
              side: BorderSide.none,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              // padding: EdgeInsets.all(15),
              fixedSize: Size(200, 60),
            ),
            label: Text(
              'Order history',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            icon: Icon(Icons.receipt_long),
          ),
        ],
      ),
    );
  }
}
