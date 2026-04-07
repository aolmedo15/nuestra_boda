import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_screen.dart';

class EnvelopeScreen extends StatefulWidget {
  const EnvelopeScreen({super.key});

  @override
  State<EnvelopeScreen> createState() => _EnvelopeScreenState();
}

class _EnvelopeScreenState extends State<EnvelopeScreen> {
  bool _opened = false;

  void _openEnvelope() {
    if (_opened) return;
    setState(() {
      _opened = true;
    });
    
    // Navegar a la pantalla principal después de la animación
    Future.delayed(const Duration(milliseconds: 1800), () {
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => const HomeScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
          transitionDuration: const Duration(milliseconds: 800),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    
    return Scaffold(
      backgroundColor: const Color(0xFFC4B2A0), // Fondo estilo mesa donde descansa el sobre
      body: Center(
        child: GestureDetector(
          onTap: _openEnvelope,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Parte trasera del sobre (fondo)
              Container(
                width: 320,
                height: 220,
                decoration: BoxDecoration(
                  color: const Color(0xFFE8DCC4), // Color interior del sobre
                  borderRadius: BorderRadius.circular(4),
                  boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 15, offset: Offset(0, 10))],
                ),
              ),
              
              // Tarjeta/Carta saliendo
              AnimatedPositioned(
                duration: const Duration(milliseconds: 1200),
                curve: Curves.easeInOutCubic,
                bottom: _opened ? 100 : 10,
                child: Container(
                  width: 290,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                    boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, -2))],
                  ),
                  alignment: Alignment.topCenter,
                  padding: const EdgeInsets.only(top: 30),
                  child: Column(
                    children: [
                      Text(
                        "Reserva la Fecha",
                        style: GoogleFonts.lato(fontSize: 14, letterSpacing: 2, color: const Color(0xFF8A7968)),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Natalia & Jonathan",
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 26,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF5A4A3F),
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              
              // Solapas inferiores y laterales del sobre (frente)
              Positioned(
                bottom: 0,
                child: ClipPath(
                  clipper: EnvelopeFrontClipper(),
                  child: Container(
                    width: 320,
                    height: 220,
                    color: const Color(0xFFD4C3B3), // Color beige del sobre frontal
                  ),
                ),
              ),

              // Solapa superior (se abre)
              AnimatedPositioned(
                duration: const Duration(milliseconds: 100), // Rápido posicionamiento
                top: _opened ? 0 : 0, 
                child: AnimatedRotation(
                  turns: _opened ? 0.5 : 0.0,
                  duration: const Duration(milliseconds: 800),
                  curve: Curves.easeInOut,
                  alignment: Alignment.topCenter,
                  child: ClipPath(
                    clipper: EnvelopeFlapClipper(),
                    child: Container(
                      width: 320,
                      height: 140,
                      color: const Color(0xFFD9C8B8), // Ligeramente más claro
                    ),
                  ),
                ),
              ),
              
              // Texto de "Toca para abrir"
              if (!_opened)
                Positioned(
                  bottom: -40,
                  child: Text(
                    "Toca para abrir",
                    style: GoogleFonts.lato(color: Colors.white, fontSize: 16, letterSpacing: 1.5),
                  ).animate(onPlay: (controller) => controller.repeat(reverse: true)).fadeIn(duration: 800.ms).moveY(begin: 0, end: 5),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class EnvelopeFlapClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width / 2, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class EnvelopeFrontClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width / 2, size.height / 2);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
