import 'package:basic_animated_text/basic_animated_text.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: BasicAnimatedText(texts: ['Hello, world!', 'Hello, Flutter!']),
        ),
      ),
    );
  }
}
