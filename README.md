# Animated Circular Progress Bar

A beautiful and customizable circular progress bar widget for Flutter with smooth built-in animations.

## Features

- 🎨 Fully customizable colors, size, and stroke width
- ✨ Smooth animations with AnimatedCustomCircularProgressBar
- 🎯 Simple API with sensible defaults
- 📦 Lightweight with no external dependencies
- 🚀 Easy to use and integrate

## Installation

Add this to your package's `pubspec.yaml` file:
```yaml
dependencies:
  animated_circular_progress_bar: ^1.0.1
```

Then run:
```bash
flutter pub get
```

## Usage

### Basic Usage (Without Animation)
```dart
import 'package:animated_circular_progress_bar/animated_circular_progress_bar.dart';

CustomCircularProgressBar(
  progress: 0.75,
  child: Center(
    child: Text('75%'),
  ),
)
```

### Animated Progress Bar (Recommended)
```dart
AnimatedCustomCircularProgressBar(
  progress: 0.75,
  duration: Duration(milliseconds: 500),
  child: Center(
    child: Text('75%'),
  ),
)
```

### Full Customization Example
```dart
AnimatedCustomCircularProgressBar(
  progress: 0.6,
  size: 120,
  strokeWidth: 5,
  foregroundColor: Colors.green,
  backgroundColor: Colors.grey.shade300,
  duration: Duration(milliseconds: 800),
  child: Center(
    child: Text(
      '60%',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
)
```

### Dynamic Progress Example
```dart
class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  double _progress = 0.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedCustomCircularProgressBar(
          progress: _progress,
          child: Center(
            child: Text('${(_progress * 100).toInt()}%'),
          ),
        ),
        Slider(
          value: _progress,
          onChanged: (value) => setState(() => _progress = value),
        ),
      ],
    );
  }
}
```

## Parameters

### CustomCircularProgressBar

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| progress | double | required | Progress value between 0.0 and 1.0 |
| child | Widget | required | Widget to display in the center |
| size | double | 96 | Diameter of the circular progress bar |
| strokeWidth | double | 3 | Width of the progress bar stroke |
| foregroundColor | Color | Colors.blue | Color of the progress indicator |
| backgroundColor | Color | Colors.grey | Color of the background circle |

### AnimatedCustomCircularProgressBar

Includes all parameters from `CustomCircularProgressBar` plus:

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| duration | Duration | 300ms | Animation duration |

## Examples

Check out the [example](example) directory for a complete sample app demonstrating various use cases.

## License

MIT License

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.