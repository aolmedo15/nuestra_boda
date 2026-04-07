import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CountdownTimer extends StatefulWidget {
  const CountdownTimer({super.key});

  @override
  State<CountdownTimer> createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  // Fecha solicitada: 22 de Agosto 2026 a las 5:00 PM
  final DateTime weddingDate = DateTime(2026, 8, 22, 17, 0);
  late Timer _timer;
  Duration _duration = const Duration();

  @override
  void initState() {
    super.initState();
    _calculateDuration();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _calculateDuration();
    });
  }

  void _calculateDuration() {
    final now = DateTime.now();
    if (weddingDate.isAfter(now)) {
      setState(() {
        _duration = weddingDate.difference(now);
      });
    } else {
      if (_timer.isActive) _timer.cancel();
      setState(() {
        _duration = const Duration(); // Llegó la fecha
      });
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Faltan",
          style: GoogleFonts.playfairDisplay(
            fontSize: 32,
            fontStyle: FontStyle.italic,
            color: const Color(0xFF5A4A3F),
          ),
        ),
        const SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _timeBox(_duration.inDays.toString(), "DÍAS"),
            _colon(),
            _timeBox((_duration.inHours % 24).toString().padLeft(2, '0'), "HORAS"),
            _colon(),
            _timeBox((_duration.inMinutes % 60).toString().padLeft(2, '0'), "MIN"),
            _colon(),
            _timeBox((_duration.inSeconds % 60).toString().padLeft(2, '0'), "SEG"),
          ],
        ),
      ],
    );
  }

  Widget _timeBox(String value, String label) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 15,
                offset: const Offset(0, 5),
              ),
            ],
            border: Border.all(color: const Color(0xFFE8DCC4), width: 1),
          ),
          alignment: Alignment.center,
          child: Text(
            value,
            style: GoogleFonts.lato(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF8A7968),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          label,
          style: GoogleFonts.lato(
            fontSize: 10,
            letterSpacing: 2,
            color: const Color(0xFF8A7968),
          ),
        ),
      ],
    );
  }

  Widget _colon() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5).copyWith(bottom: 25),
      child: Text(
        ":",
        style: GoogleFonts.playfairDisplay(
          fontSize: 24,
          color: const Color(0xFF8A7968),
        ),
      ),
    );
  }
}
