import 'package:flutter/material.dart';
import '../models/animation_config.dart';

class AnimationControllerManager {
  late AnimationController logoController;
  late AnimationController textController;
  late AnimationController backgroundController;
  late AnimationController particleController;

  late Animation<double> logoScaleAnimation;
  late Animation<double> logoRotationAnimation;
  late Animation<double> textFadeAnimation;
  late Animation<double> textSlideAnimation;
  late Animation<double> backgroundAnimation;
  late Animation<double> particleAnimation;

  void initialize(TickerProvider vsync, AnimationConfig config) {
    // Initialize controllers
    logoController = AnimationController(
      duration: config.logoAnimationDuration,
      vsync: vsync,
    );

    textController = AnimationController(
      duration: config.textAnimationDuration,
      vsync: vsync,
    );

    backgroundController = AnimationController(
      duration: config.backgroundAnimationDuration,
      vsync: vsync,
    );

    particleController = AnimationController(
      duration: config.particleAnimationDuration,
      vsync: vsync,
    );

    // Setup animations
    logoScaleAnimation = Tween<double>(
      begin: 0.0,
      end: 1.5,
    ).animate(CurvedAnimation(
      parent: logoController,
      curve: Curves.elasticOut,
    ));

    logoRotationAnimation = Tween<double>(
      begin: 0.0,
      end: 6.3,
    ).animate(CurvedAnimation(
      parent: logoController,
      curve: Curves.easeInOut,
    ));

    textFadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: textController,
      curve: Curves.easeIn,
    ));

    textSlideAnimation = Tween<double>(
      begin: 50.0,
      end: 0.0,
    ).animate(CurvedAnimation(
      parent: textController,
      curve: Curves.easeOut,
    ));

    backgroundAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: backgroundController,
      curve: Curves.easeInOut,
    ));

    particleAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: particleController,
      curve: Curves.linear,
    ));
  }

  void dispose() {
    logoController.dispose();
    textController.dispose();
    backgroundController.dispose();
    particleController.dispose();
  }

  Future<void> startAnimationSequence(AnimationConfig config) async {
    await Future.delayed(const Duration(milliseconds: 500));

    // Start background animation
    backgroundController.forward();

    // Start logo animation
    await Future.delayed(config.delayBetweenAnimations);
    logoController.forward();

    // Start text animation
    await Future.delayed(const Duration(milliseconds: 800));
    textController.forward();

    // Start particle animation
    particleController.repeat();
  }
}