import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mama_put/models/menu_item.dart';
import 'package:mama_put/utils/format_naira.dart';
import 'package:mama_put/widgets/qty_stepper.dart';

class MenuItemCard extends StatelessWidget {
  const MenuItemCard({
    super.key,
    required this.item,
    required this.qty,
    required this.increaseQty,
    required this.decreaseQty,
  });

  final MenuItem item;
  final int qty;
  final Function() increaseQty;
  final Function() decreaseQty;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 1))
        ]
      ),
      child: Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 20,
          children: [
            Container(
              height: 50,
              width: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Color(0xFFFDEBD3),
                borderRadius: BorderRadius.circular(12)
                ),
              child: Text(item.emoji, style: TextStyle(fontSize: 35)),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    // width: 150,
                    child: Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.name,
                            style: GoogleFonts.poppins(
                              color: Color(0xFF2B2B2B),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            item.description,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                              color: Color(0xFF2B2B2B),
                              fontSize: 10,
                            ),
                          ),
                          Text(
                            formatNaira(item.price),
                            style: GoogleFonts.poppins(
                              color: Color(0xFFE08A00),
                              fontSize: 14,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            QtyStepper(
                    qty: qty,
                    increaseQty: increaseQty,
                    decreaseQty: decreaseQty,
                  ),
          ],
        ),
      ),
    );
  }
}
