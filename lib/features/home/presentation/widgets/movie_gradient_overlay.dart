import 'package:flutter/material.dart';

class MovieGradientOverlay extends StatelessWidget {
  const MovieGradientOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.black.withOpacity(0.3),
              Colors.black.withOpacity(0.8),
            ],
            stops: const [0.0, 0.6, 1.0],
          ),
        ),
      ),
    );
  }
} 