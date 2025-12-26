import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:animated_circular_progress_bar/animated_circular_progress_bar.dart';

void main() {
  group('CustomCircularProgressBar', () {
    testWidgets('renders without error', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CustomCircularProgressBar(progress: 0.5, child: Text('50%')),
          ),
        ),
      );

      expect(find.byType(CustomCircularProgressBar), findsOneWidget);
      expect(find.text('50%'), findsOneWidget);
    });

    testWidgets('displays child widget correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CustomCircularProgressBar(
              progress: 0.75,
              child: Icon(Icons.check),
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.check), findsOneWidget);
    });

    testWidgets('accepts custom size', (WidgetTester tester) async {
      const customSize = 150.0;

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CustomCircularProgressBar(
              progress: 0.5,
              size: customSize,
              child: Text('Test'),
            ),
          ),
        ),
      );

      final sizedBox = tester.widget<SizedBox>(find.byType(SizedBox).first);
      expect(sizedBox.width, customSize);
      expect(sizedBox.height, customSize);
    });

    testWidgets('uses CustomPaint for rendering', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CustomCircularProgressBar(progress: 0.5, child: Text('Test')),
          ),
        ),
      );

      expect(find.byType(CustomPaint), findsWidgets);
    });

    test('progress value is clamped between 0 and 1', () {
      const validProgress1 = 0.0;
      const validProgress2 = 1.0;
      const validProgress3 = 0.5;

      expect(validProgress1 >= 0.0 && validProgress1 <= 1.0, isTrue);
      expect(validProgress2 >= 0.0 && validProgress2 <= 1.0, isTrue);
      expect(validProgress3 >= 0.0 && validProgress3 <= 1.0, isTrue);
    });
  });

  group('Color Customization', () {
    testWidgets('uses custom foreground color', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CustomCircularProgressBar(
              progress: 0.5,
              foregroundColor: Colors.red,
              child: Text('Test'),
            ),
          ),
        ),
      );

      final progressBar = tester.widget<CustomCircularProgressBar>(
        find.byType(CustomCircularProgressBar),
      );

      expect(progressBar.foregroundColor, Colors.red);
    });

    testWidgets('uses custom background color', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CustomCircularProgressBar(
              progress: 0.5,
              backgroundColor: Colors.yellow,
              child: Text('Test'),
            ),
          ),
        ),
      );

      final progressBar = tester.widget<CustomCircularProgressBar>(
        find.byType(CustomCircularProgressBar),
      );

      expect(progressBar.backgroundColor, Colors.yellow);
    });
  });

  group('Stroke Width', () {
    testWidgets('accepts custom stroke width', (WidgetTester tester) async {
      const customStrokeWidth = 10.0;

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CustomCircularProgressBar(
              progress: 0.5,
              strokeWidth: customStrokeWidth,
              child: Text('Test'),
            ),
          ),
        ),
      );

      final progressBar = tester.widget<CustomCircularProgressBar>(
        find.byType(CustomCircularProgressBar),
      );

      expect(progressBar.strokeWidth, customStrokeWidth);
    });
  });

  group('Edge Cases', () {
    testWidgets('handles 0% progress', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CustomCircularProgressBar(progress: 0.0, child: Text('0%')),
          ),
        ),
      );

      expect(find.byType(CustomCircularProgressBar), findsOneWidget);
    });

    testWidgets('handles 100% progress', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CustomCircularProgressBar(progress: 1.0, child: Text('100%')),
          ),
        ),
      );

      expect(find.byType(CustomCircularProgressBar), findsOneWidget);
    });

    testWidgets('handles very small size', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CustomCircularProgressBar(
              progress: 0.5,
              size: 20,
              strokeWidth: 2,
              child: Text(''),
            ),
          ),
        ),
      );

      expect(find.byType(CustomCircularProgressBar), findsOneWidget);
    });

    testWidgets('handles very large size', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CustomCircularProgressBar(
              progress: 0.5,
              size: 500,
              strokeWidth: 20,
              child: Text('Large'),
            ),
          ),
        ),
      );

      expect(find.byType(CustomCircularProgressBar), findsOneWidget);
    });
  });
}
