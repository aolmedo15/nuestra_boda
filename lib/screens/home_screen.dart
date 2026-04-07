import 'package:flutter/material.dart';
import '../widgets/hero_section.dart';
import '../widgets/countdown_timer.dart';
import '../widgets/itinerary_section.dart';
import '../widgets/photo_gallery.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HeroSection(),
            const SizedBox(height: 60),
            const CountdownTimer(),
            const SizedBox(height: 80),
            const PhotoGallery(),
            const SizedBox(height: 80),
            const ItinerarySection(),
            const SizedBox(height: 100),
            // Footer
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(40),
              color: const Color(0xFFD4C3B3).withOpacity(0.3),
              child: const Column(
                children: [
                  Text(
                    "¡Los esperamos!",
                    style: TextStyle(
                      fontFamily: 'Playfair Display',
                      fontSize: 32,
                      fontStyle: FontStyle.italic,
                      color: Color(0xFF5A4A3F),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Natalia & Jonathan",
                    style: TextStyle(
                      letterSpacing: 2,
                      color: Color(0xFF8A7968),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
