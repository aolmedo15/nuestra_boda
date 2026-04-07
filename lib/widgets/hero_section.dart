import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.85,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/boda1.jpeg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [Colors.black.withOpacity(0.7), Colors.transparent],
          ),
        ),
        padding: const EdgeInsets.only(bottom: 60),
        alignment: Alignment.bottomCenter,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Nuestra Boda",
              style: GoogleFonts.lato(
                color: Colors.white70,
                fontSize: 16,
                letterSpacing: 4,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Natalia & Jonathan",
              style: GoogleFonts.playfairDisplay(
                color: Colors.white,
                fontSize: 48,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 15),
            Text(
              "22 DE AGOSTO 2026",
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 14,
                letterSpacing: 3,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
