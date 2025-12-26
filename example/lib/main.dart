import 'package:flutter/material.dart';
import 'package:animated_circular_progress_bar/animated_circular_progress_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated Circular Progress Bar Demo',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: const DemoPage(),
    );
  }
}

class DemoPage extends StatefulWidget {
  const DemoPage({super.key});

  @override
  State<DemoPage> createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  double _progress = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Circular Progress Bar'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Main animated progress bar
              AnimatedCustomCircularProgressBar(
                progress: _progress,
                size: 200,
                strokeWidth: 10,
                foregroundColor: Colors.blue,
                backgroundColor: Colors.grey.shade300,
                duration: const Duration(milliseconds: 500),
                child: Center(
                  child: Text(
                    '${(_progress * 100).toInt()}%',
                    style: const TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 60),

              // Slider to control progress
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    const Text(
                      'Adjust Progress',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Slider(
                      value: _progress,
                      onChanged: (value) {
                        setState(() {
                          _progress = value;
                        });
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              // Quick action buttons
              Wrap(
                spacing: 10,
                runSpacing: 10,
                alignment: WrapAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => setState(() => _progress = 0.25),
                    child: const Text('25%'),
                  ),
                  ElevatedButton(
                    onPressed: () => setState(() => _progress = 0.5),
                    child: const Text('50%'),
                  ),
                  ElevatedButton(
                    onPressed: () => setState(() => _progress = 0.75),
                    child: const Text('75%'),
                  ),
                  ElevatedButton(
                    onPressed: () => setState(() => _progress = 1.0),
                    child: const Text('100%'),
                  ),
                ],
              ),

              const SizedBox(height: 60),

              // Multiple small examples
              const Text(
                'Different Styles',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AnimatedCustomCircularProgressBar(
                    progress: _progress,
                    size: 80,
                    strokeWidth: 6,
                    foregroundColor: Colors.green,
                    backgroundColor: Colors.green.shade100,
                    child: const Icon(Icons.check, color: Colors.green),
                  ),
                  AnimatedCustomCircularProgressBar(
                    progress: _progress,
                    size: 80,
                    strokeWidth: 4,
                    foregroundColor: Colors.orange,
                    backgroundColor: Colors.orange.shade100,
                    child: const Icon(Icons.timer, color: Colors.orange),
                  ),
                  AnimatedCustomCircularProgressBar(
                    progress: _progress,
                    size: 80,
                    strokeWidth: 8,
                    foregroundColor: Colors.purple,
                    backgroundColor: Colors.purple.shade100,
                    child: const Icon(Icons.star, color: Colors.purple),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
