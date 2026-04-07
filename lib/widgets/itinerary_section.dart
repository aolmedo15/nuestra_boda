import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ItinerarySection extends StatelessWidget {
  const ItinerarySection({super.key});

  final List<Map<String, String>> itineraryEvents = const [
    {"time": "4:30 PM", "title": "Recepción", "desc": "Llegada al lugar mágico y acomodación de nuestros queridos invitados."},
    {"time": "5:00 PM", "title": "Ceremonia", "desc": "El momento más especial donde daremos nuestro ¡Sí, acepto! frente a todos."},
    {"time": "6:30 PM", "title": "Cóctel y Brindis", "desc": "Bebidas, comida deliciosa y las primeras fotos como esposos oficiales."},
    {"time": "8:00 PM", "title": "Cena y Fiesta", "desc": "A disfrutar de una velada inolvidable. ¡A celebrar hasta el amanecer!"},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 20, offset: Offset(0, 10))],
      ),
      child: Column(
        children: [
          Text(
            "Itinerario",
            style: GoogleFonts.playfairDisplay(
              fontSize: 32,
              fontStyle: FontStyle.italic,
              color: const Color(0xFF5A4A3F),
            ),
          ),
          const SizedBox(height: 50),
          ...itineraryEvents.asMap().entries.map((entry) {
            final idx = entry.key;
            final event = entry.value;
            final isLeft = idx % 2 == 0;
            final isLast = idx == itineraryEvents.length - 1;

            return Padding(
              padding: const EdgeInsets.only(bottom: 0),
              child: IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildEventCard(event, isLeft, !isLeft),
                    _buildTimelineCenter(isLast),
                    _buildEventCard(event, isLeft, isLeft),
                  ],
                ),
              ),
            ).animate().slideY(begin: 0.2, end: 0, duration: 800.ms, curve: Curves.easeOutCubic).fadeIn();
          }),
        ],
      ),
    );
  }

  Widget _buildTimelineCenter(bool isLast) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Container(
            width: 14,
            height: 14,
            margin: const EdgeInsets.only(top: 5),
            decoration: BoxDecoration(
              color: const Color(0xFF8A7968),
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFFD4C3B3), width: 3),
            ),
          ),
          if (!isLast)
            Expanded(
              child: Container(
                width: 2,
                color: const Color(0xFFD4C3B3).withOpacity(0.5),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildEventCard(Map<String, String> event, bool isLeft, bool isEmpty) {
    if (isEmpty) return Expanded(child: const SizedBox.shrink());

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 40),
        child: Column(
          crossAxisAlignment: isLeft ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Text(
              event['time']!,
              style: GoogleFonts.lato(
                fontWeight: FontWeight.bold,
                color: const Color(0xFF8A7968),
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              event['title']!,
              style: GoogleFonts.playfairDisplay(
                fontWeight: FontWeight.w600,
                color: const Color(0xFF5A4A3F),
                fontSize: 18,
              ),
              textAlign: isLeft ? TextAlign.right : TextAlign.left,
            ),
            const SizedBox(height: 8),
            Text(
              event['desc']!,
              style: GoogleFonts.lato(
                color: const Color(0xFF6B5B4E),
                fontSize: 13,
                height: 1.4,
              ),
              textAlign: isLeft ? TextAlign.right : TextAlign.left,
            ),
          ],
        ),
      ),
    );
  }
}
