import 'package:flutter/material.dart';

class ParticleBackground extends StatelessWidget {
  final Animation<double> animation;

  const ParticleBackground({
    Key? key,
    required this.animation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return CustomPaint(
          painter: ParticlePainter(animation.value),
          size: Size.infinite,
        );
      },
    );
  }
}

class ParticlePainter extends CustomPainter {
  final double animationValue;

  ParticlePainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.3)
      ..style = PaintingStyle.fill;

    for (int i = 0; i < 20; i++) {
      final x = (size.width * 0.1) +
          (size.width * 0.8) * ((i * 0.1 + animationValue) % 1.0);
      final y = (size.height * 0.1) +
          (size.height * 0.8) * ((i * 0.07 + animationValue * 0.5) % 1.0);

      final radius = 2.0 + (i % 3) * 1.5;
      canvas.drawCircle(Offset(x, y), radius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}