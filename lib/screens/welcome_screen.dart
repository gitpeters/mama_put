import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen(this.seeMenue, {super.key});

  final Function() seeMenue;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/mama_put_logo.png', width: 200),
            SizedBox(height: 20),
            Text(
              'Mama Put',
              style: GoogleFonts.poppins(
                fontSize: 35,
                fontWeight: FontWeight.w900,
                color: Color(0xFF1E7B4F),
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Hot local food, delivered. \nNo wahala.',
              style: GoogleFonts.poppins(
                fontSize: 18,
                color: Color(0xFF2B2B2B),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),

            OutlinedButton.icon(
              iconAlignment: IconAlignment.end,
              onPressed: seeMenue,
              style: OutlinedButton.styleFrom(
                foregroundColor: Color(0xFFFFF8F0),
                backgroundColor: Color(0xFF1E7B4F),
                shape: const RoundedRectangleBorder(
                  side: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                padding: EdgeInsets.all(15),
                fixedSize: Size.fromWidth(240)
              ),
              label: Text(
                "See today's menu",
                style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              icon: Icon(
                Icons.arrow_right_alt,
                size: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
    );
  }
}
