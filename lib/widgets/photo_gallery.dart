import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';

class PhotoGallery extends StatelessWidget {
  const PhotoGallery({super.key});

  final List<String> imgList = const [
    'assets/images/couple_hero.png',
    'assets/images/couple_hands.png',
    'assets/images/couple_walking.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Nuestra Historia",
          style: GoogleFonts.playfairDisplay(
            fontSize: 32,
            fontStyle: FontStyle.italic,
            color: const Color(0xFF5A4A3F),
          ),
        ),
        const SizedBox(height: 40),
        CarouselSlider(
          options: CarouselOptions(
            height: 380.0,
            autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: 16 / 9,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            viewportFraction: 0.8,
          ),
          items: imgList.map((item) => Container(
            margin: const EdgeInsets.symmetric(horizontal: 5.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              image: DecorationImage(
                image: AssetImage(item),
                fit: BoxFit.cover,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  blurRadius: 15,
                  offset: const Offset(0, 8),
                )
              ]
            ),
          )).toList(),
        ),
      ],
    );
  }
}
