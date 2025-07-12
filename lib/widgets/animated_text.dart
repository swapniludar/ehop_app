import 'package:flutter/material.dart';
import '../utils/app_theme.dart';

class AnimatedText extends StatelessWidget {
  final Animation<double> fadeAnimation;
  final Animation<double> slideAnimation;
  final String appName;
  final String tagline;

  const AnimatedText({
    Key? key,
    required this.fadeAnimation,
    required this.slideAnimation,
    required this.appName,
    required this.tagline,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: fadeAnimation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, slideAnimation.value),
          child: Opacity(
            opacity: fadeAnimation.value,
            child: Column(
              children: [
                Text(
                  appName,
                  style: AppTheme.appNameStyle,
                ),
                const SizedBox(height: 10),
                Text(
                  tagline,
                  style: AppTheme.taglineStyle.copyWith(
                    color: Colors.white.withOpacity(0.9),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}