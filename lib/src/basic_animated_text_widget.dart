import 'dart:async';

import 'package:flutter/material.dart';

class BasicAnimatedText extends StatefulWidget {
  final String text;
  final Duration? writeDuration;
  final Duration? deleteDuration;
  final TextStyle? textStyle;
  const BasicAnimatedText({
    super.key,
    required this.text,
    this.writeDuration,
    this.deleteDuration,
    this.textStyle,
  });

  @override
  _BasicAnimatedTextState createState() => _BasicAnimatedTextState();
}

class _BasicAnimatedTextState extends State<BasicAnimatedText> {
  late String text;
  String displayedText = "";
  int charIndex = 0;
  Timer? timer;
  bool isDeleting = false;
  late Duration writeDuration;
  late Duration deleteDuration;

  @override
  void initState() {
    super.initState();
    text = widget.text;
    writeDuration = widget.writeDuration ?? const Duration(milliseconds: 150);
    writeDuration = widget.deleteDuration ?? const Duration(milliseconds: 50);
    timer = Timer.periodic(writeDuration, (Timer t) => _updateText());
  }

  void _updateText() {
    if (mounted) {
      setState(() {
        if (isDeleting) {
          displayedText = text.substring(0, charIndex);
          charIndex--;
          if (charIndex == 0) {
            isDeleting = false;
            timer?.cancel();
            timer = Timer.periodic(writeDuration, (Timer t) => _updateText());
          }
        } else {
          displayedText = text.substring(0, charIndex);
          charIndex++;
          if (charIndex == text.length) {
            isDeleting = true;
            timer?.cancel();
            timer = Timer.periodic(deleteDuration, (Timer t) => _updateText());
          }
        }
      });
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(displayedText, style: widget.textStyle ?? const TextStyle(fontSize: 24));
  }
}
