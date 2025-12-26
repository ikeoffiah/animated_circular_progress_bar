import 'package:animated_circular_progress_bar/src/circular_progress_painter.dart';
import 'package:flutter/material.dart';

/// A widget that displays a static circular progress bar.
///
/// This widget uses [CircularProgressPainter] to render the progress bar.
class CustomCircularProgressBar extends StatelessWidget {
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

  const CustomCircularProgressBar({
    super.key,
    required this.progress,
    required this.child,
    this.size = 96,
    this.strokeWidth = 3,
    this.foregroundColor = Colors.blue,
    this.backgroundColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        foregroundPainter: CircularProgressPainter(
          progress: progress,
          strokeWidth: strokeWidth,
          foregroundColor: foregroundColor,
          backgroundColor: backgroundColor,
        ),
        child: child,
      ),
    );
  }
}
