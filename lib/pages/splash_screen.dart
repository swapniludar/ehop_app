import 'package:flutter/material.dart';
import '../models/animation_config.dart';
import '../utils/app_theme.dart';
import '../widgets/animated_logo.dart';
import '../widgets/animated_text.dart';
import '../widgets/particle_background.dart';
import '../widgets/loading_indicator.dart';
import '../controllers/animation_controller_manager.dart';
import 'home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  final AnimationControllerManager _animationManager = AnimationControllerManager();
  final AnimationConfig _config = const AnimationConfig();

  @override
  void initState() {
    super.initState();
    _animationManager.initialize(this, _config);
    _startSplashSequence();
  }

  Future<void> _startSplashSequence() async {
    await _animationManager.startAnimationSequence(_config);

    // Navigate to benefits screen after splash duration
    await Future.delayed(_config.splashDisplayDuration);
    _navigateToBenefitsScreen();
  }

  void _navigateToBenefitsScreen() {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => const Home(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
        transitionDuration: const Duration(milliseconds: 500),
      ),
    );
  }

  @override
  void dispose() {
    _animationManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppTheme.backgroundGradient,
        ),
        child: Stack(
          children: [
            // Animated background particles
            ParticleBackground(
              animation: _animationManager.particleAnimation,
            ),

            // Main content
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Animated logo
                  AnimatedLogo(
                    scaleAnimation: _animationManager.logoScaleAnimation,
                    rotationAnimation: _animationManager.logoRotationAnimation,
                    imagePath: 'assets/images/ehop_logo_4.jpg', // Your custom image
                    useAssetImage: true
                  ),

                  const SizedBox(height: 40),

                  // Animated app name and tagline
                  AnimatedText(
                    fadeAnimation: _animationManager.textFadeAnimation,
                    slideAnimation: _animationManager.textSlideAnimation,
                    appName: 'e-hop',
                    tagline: 'Comprehensive care, anytime, anywhere',
                  ),
                ],
              ),
            ),

            // Loading indicator at bottom
            Positioned(
              bottom: 80,
              left: 0,
              right: 0,
              child: LoadingIndicator(
                animation: _animationManager.backgroundAnimation,
              ),
            ),
          ],
        ),
      ),
    );
  }
}