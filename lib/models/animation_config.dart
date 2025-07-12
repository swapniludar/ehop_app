class AnimationConfig {
  final Duration logoAnimationDuration;
  final Duration textAnimationDuration;
  final Duration backgroundAnimationDuration;
  final Duration particleAnimationDuration;
  final Duration splashDisplayDuration;
  final Duration delayBetweenAnimations;

  const AnimationConfig({
    this.logoAnimationDuration = const Duration(milliseconds: 1500),
    this.textAnimationDuration = const Duration(milliseconds: 1000),
    this.backgroundAnimationDuration = const Duration(milliseconds: 2000),
    this.particleAnimationDuration = const Duration(milliseconds: 3000),
    this.splashDisplayDuration = const Duration(milliseconds: 3000),
    this.delayBetweenAnimations = const Duration(milliseconds: 300),
  });
}