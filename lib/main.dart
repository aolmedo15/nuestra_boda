import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/envelope_screen.dart';

void main() {
  runApp(const NuestraBodaApp());
}

class NuestraBodaApp extends StatelessWidget {
  const NuestraBodaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Invitación de Boda - Natalia & Jonathan',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFD4C3B3), // Tono beige principal
          primary: const Color(0xFFD4C3B3),
          secondary: const Color(0xFFE8DCC4),
          surface: const Color(0xFFFAF8F5),
          onPrimary: Colors.white,
        ),
        scaffoldBackgroundColor: const Color(0xFFFAF8F5), // Blanco hueso cálido
        textTheme: GoogleFonts.latoTextTheme(Theme.of(context).textTheme).apply(
          bodyColor: const Color(0xFF4A4A4A),
          displayColor: const Color(0xFF5A4A3F),
        ),
        useMaterial3: true,
      ),
      home: const EnvelopeScreen(),
    );
  }
}
