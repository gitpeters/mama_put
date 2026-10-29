import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QtyStepper extends StatelessWidget {
  const QtyStepper({
    super.key,
    required this.qty,
    required this.increaseQty,
    required this.decreaseQty,
  });

  final int qty;
  final void Function() increaseQty;
  final void Function() decreaseQty;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 5,
      children: [
        OutlinedButton(
          onPressed: qty <= 0 ? null : decreaseQty,
          style: OutlinedButton.styleFrom(
            minimumSize: Size.zero,
            padding: EdgeInsets.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            fixedSize: const Size(40, 40),
            backgroundColor: const Color(0xFFE3F0E8),
            foregroundColor: const Color(0xFF1E7B4F),
            disabledBackgroundColor: const Color(0xFFF0ECE6),
            disabledForegroundColor: const Color(0xFFC4BCB2),
            side: BorderSide.none,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text(
            '−',
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(
          width: 24,
          child: Text(
            '$qty',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2B2B2B),
            ),
          ),
        ),
        OutlinedButton(
          onPressed: increaseQty,
          style: OutlinedButton.styleFrom(
            minimumSize: Size.zero,
            padding: EdgeInsets.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            fixedSize: const Size(40, 40),
            backgroundColor: const Color(0xFFE3F0E8),
            foregroundColor: const Color(0xFF1E7B4F),
            side: BorderSide.none,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text(
            '+',
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w800,
              color: Color(0xFF1E7B4F),
            ),
          ),
        ),
      ],
    );
  }
}
