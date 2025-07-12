import 'package:flutter/material.dart';
import '../utils/app_theme.dart';

class AnimatedLogo extends StatefulWidget {
  final Animation<double> scaleAnimation;
  final Animation<double> rotationAnimation;
  final double size;
  final String? imagePath; // Custom image path
  final bool useAssetImage; // Toggle between asset and network image

  const AnimatedLogo({
    Key? key,
    required this.scaleAnimation,
    required this.rotationAnimation,
    this.size = 120,
    this.imagePath, // e.g., 'assets/images/health_logo.png'
    this.useAssetImage = true, // Default to asset image
  }) : super(key: key);

  @override
  State<AnimatedLogo> createState() => _AnimatedLogoState();
}

class _AnimatedLogoState extends State<AnimatedLogo>
    with SingleTickerProviderStateMixin {
  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _pulseAnimation = Tween<double>(
      begin: 0.8,
      end: 1.2,
    ).animate(CurvedAnimation(
      parent: _pulseController,
      curve: Curves.easeInOut,
    ));

    // Start pulse animation after a delay
    Future.delayed(const Duration(milliseconds: 1000), () {
      if (mounted) {
        _pulseController.repeat(reverse: true);
      }
    });
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  Widget _buildLogoContent() {
    if (widget.imagePath != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(widget.size * 1.3),
        child: widget.useAssetImage
            ? Image.asset(
          widget.imagePath!,
          width: widget.size * 1.6,
          height: widget.size * 1.6,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            // Fallback to icon if image fails to load
            return Icon(
              Icons.health_and_safety,
              size: widget.size * 0.4,
              color: AppTheme.primaryColor,
            );
          },
        )
            : Image.network(
          widget.imagePath!,
          width: widget.size * 0.6,
          height: widget.size * 0.6,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return SizedBox(
              width: widget.size * 0.6,
              height: widget.size * 0.6,
              child: Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes!
                      : null,
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    AppTheme.primaryColor,
                  ),
                ),
              ),
            );
          },
          errorBuilder: (context, error, stackTrace) {
            // Fallback to icon if image fails to load
            return Icon(
              Icons.health_and_safety,
              size: widget.size * 0.4,
              color: AppTheme.primaryColor,
            );
          },
        ),
      );
    } else {
      // Fallback to default health icon
      return Icon(
        Icons.health_and_safety,
        size: widget.size * 0.4,
        color: AppTheme.primaryColor,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.scaleAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: widget.scaleAnimation.value,
          child: Transform.rotate(
            angle: widget.rotationAnimation.value,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Outer pulsing ring
                AnimatedBuilder(
                  animation: _pulseAnimation,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: _pulseAnimation.value,
                      child: Container(
                        width: widget.size + 20,
                        height: widget.size + 20,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white.withOpacity(0.3),
                            width: 2,
                          ),
                        ),
                      ),
                    );
                  },
                ),

                // Main logo container
                Container(
                  width: widget.size,
                  height: widget.size,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.white.withOpacity(0.95),
                        Colors.white.withOpacity(0.8),
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Health cross background
                      Container(
                        width: widget.size * 0.6,
                        height: widget.size * 0.6,
                        decoration: BoxDecoration(
                          color: AppTheme.primaryColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),

                      // Main health icon
                      /*Icon(
                        Icons.health_and_safety,
                        size: widget.size * 0.4,
                        color: AppTheme.primaryColor,
                      ),*/

                      _buildLogoContent(),

                      // Small heartbeat line
                      Positioned(
                        bottom: widget.size * 0.25,
                        child: Container(
                          width: widget.size * 0.3,
                          height: 2,
                          decoration: BoxDecoration(
                            color: Colors.red.withOpacity(0.7),
                            borderRadius: BorderRadius.circular(1),
                          ),
                        ),
                      ),

                      // Animated checkmark
                      AnimatedBuilder(
                        animation: _pulseAnimation,
                        builder: (context, child) {
                          return Positioned(
                            top: widget.size * 0.15,
                            right: widget.size * 0.15,
                            child: Transform.scale(
                              scale: _pulseAnimation.value * 0.8,
                              child: Container(
                                width: 24,
                                height: 24,
                                decoration: const BoxDecoration(
                                  color: Colors.green,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 16,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
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