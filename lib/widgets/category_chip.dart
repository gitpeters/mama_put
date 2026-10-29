import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryChip extends StatelessWidget {

  const CategoryChip({
    super.key,
    required this.label, 
    required this.isSelected, 
    required this.onTap
    });

  final String label;
  final bool isSelected;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onTap,
      style: OutlinedButton.styleFrom(
        foregroundColor: isSelected ? Colors.white : const Color(0xFF2B2B2B),
        backgroundColor: isSelected ? const Color(0xFF1E7B4F) : Colors.white,
        side: BorderSide(
          color: isSelected ? const Color(0xFF1E7B4F) : const Color(0xFFE5D9CB),
        ),
        shape: const StadiumBorder(),
      ), 
      child: Text(
        label, 
        style: GoogleFonts.poppins(fontSize: 14, fontWeight: isSelected ? FontWeight.bold : FontWeight.normal),)
      );
  }
}