import 'package:flutter/material.dart';
import 'custom_circular_progress_bar.dart';

/// A widget that displays an animated circular progress bar.
///
/// This widget uses a [TweenAnimationBuilder] to animate transitions between
/// different [progress] values over a specified [duration].
class AnimatedCustomCircularProgressBar extends StatelessWidget {
  /// The current progress value, ranging from 0.0 to 1.0.
  final double progress;

  /// The diameter of the circular progress bar.
  /// Defaults to 96.0.
  final double size;

  /// The width of the progress bar's stroke.
  /// Defaults to 3.0.
  final double strokeWidth;

  /// The color of the progress arc.
  /// Defaults to [Colors.blue].
  final Color foregroundColor;

  /// The color of the background circle.
  /// Defaults to [Colors.grey].
  final Color backgroundColor;

  /// The widget to display in the center of the progress bar.
  final Widget child;

  /// The duration of the animation when [progress] changes.
  /// Defaults to 300 milliseconds.
  final Duration duration;

  const AnimatedCustomCircularProgressBar({
    super.key,
    required this.progress,
    required this.child,
    this.size = 96,
    this.strokeWidth = 3,
    this.foregroundColor = Colors.blue,
    this.backgroundColor = Colors.grey,
    this.duration = const Duration(milliseconds: 300),
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: progress),
      duration: duration,
      builder: (context, value, child) {
        return CustomCircularProgressBar(
          progress: value,
          size: size,
          strokeWidth: strokeWidth,
          foregroundColor: foregroundColor,
          backgroundColor: backgroundColor,
          child: this.child,
        );
      },
    );
  }
}
