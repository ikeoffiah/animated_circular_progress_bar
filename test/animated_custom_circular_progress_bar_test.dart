import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:animated_circular_progress_bar/animated_circular_progress_bar.dart';

void main() {
  group('AnimatedCustomCircularProgressBar', () {
    testWidgets('renders without error', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AnimatedCustomCircularProgressBar(
              progress: 0.5,
              child: Text('50%'),
            ),
          ),
        ),
      );

      expect(find.byType(AnimatedCustomCircularProgressBar), findsOneWidget);
      expect(find.text('50%'), findsOneWidget);
    });

    testWidgets('animates progress changes', (WidgetTester tester) async {
      double progress = 0.0;

      await tester.pumpWidget(
        StatefulBuilder(
          builder: (context, setState) {
            return MaterialApp(
              home: Scaffold(
                body: Column(
                  children: [
                    AnimatedCustomCircularProgressBar(
                      progress: progress,
                      duration: const Duration(milliseconds: 300),
                      child: Text('${(progress * 100).toInt()}%'),
                    ),
                    ElevatedButton(
                      onPressed: () => setState(() => progress = 1.0),
                      child: const Text('Update'),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );

      // Initial state
      expect(find.text('0%'), findsOneWidget);

      // Tap button to update progress
      await tester.tap(find.text('Update'));
      await tester.pump(); // Start animation

      // Advance to some point mid-animation
      await tester.pump(const Duration(milliseconds: 50));

      // The internal CustomCircularProgressBar should not be at 1.0 yet
      final internalProgress = tester
          .widget<CustomCircularProgressBar>(
            find.byType(CustomCircularProgressBar),
          )
          .progress;
      expect(internalProgress, lessThan(1.0));
      expect(internalProgress, greaterThan(0.0));

      // Complete animation
      await tester.pumpAndSettle();
      expect(find.text('100%'), findsOneWidget);
    });

    testWidgets('respects custom size and colors', (WidgetTester tester) async {
      const customSize = 120.0;
      const customForegroundColor = Colors.green;
      const customBackgroundColor = Colors.red;

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AnimatedCustomCircularProgressBar(
              progress: 0.75,
              size: customSize,
              foregroundColor: customForegroundColor,
              backgroundColor: customBackgroundColor,
              child: Text('Test'),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      final progressBar = tester.widget<CustomCircularProgressBar>(
        find.byType(CustomCircularProgressBar),
      );

      expect(progressBar.size, customSize);
      expect(progressBar.foregroundColor, customForegroundColor);
      expect(progressBar.backgroundColor, customBackgroundColor);
    });

    testWidgets('respects custom stroke width', (WidgetTester tester) async {
      const customStrokeWidth = 8.0;

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AnimatedCustomCircularProgressBar(
              progress: 0.5,
              strokeWidth: customStrokeWidth,
              child: Text('Test'),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      final progressBar = tester.widget<CustomCircularProgressBar>(
        find.byType(CustomCircularProgressBar),
      );

      expect(progressBar.strokeWidth, customStrokeWidth);
    });

    testWidgets('handles duration correctly', (WidgetTester tester) async {
      const customDuration = Duration(milliseconds: 500);

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AnimatedCustomCircularProgressBar(
              progress: 0.5,
              duration: customDuration,
              child: Text('Test'),
            ),
          ),
        ),
      );

      final tweenBuilder = tester.widget<TweenAnimationBuilder<double>>(
        find.byType(TweenAnimationBuilder<double>),
      );

      expect(tweenBuilder.duration, customDuration);
    });
  });
}
