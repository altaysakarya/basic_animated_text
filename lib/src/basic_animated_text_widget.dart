// ignore_for_file: library_private_types_in_public_api

import 'dart:async';

import 'package:flutter/material.dart';

class BasicAnimatedText extends StatefulWidget {
  final List<String> texts;
  final Duration? writeDuration;
  final Duration? deleteDuration;
  final TextStyle? textStyle;
  const BasicAnimatedText({
    super.key,
    required this.texts,
    this.writeDuration,
    this.deleteDuration,
    this.textStyle,
  });

  @override
  _BasicAnimatedTextState createState() => _BasicAnimatedTextState();
}

class _BasicAnimatedTextState extends State<BasicAnimatedText> {
  late List<String> texts;
  String displayedText = "";
  int textIndex = 0;
  int charIndex = 0;
  Timer? timer;
  bool isDeleting = false;
  late Duration writeDuration;
  late Duration deleteDuration;

  @override
  void initState() {
    super.initState();
    texts = widget.texts;
    writeDuration = widget.writeDuration ?? const Duration(milliseconds: 150);
    deleteDuration = widget.deleteDuration ?? const Duration(milliseconds: 50);
    timer = Timer.periodic(writeDuration, (Timer t) => _updateText());
  }

  void _updateText() {
    if (mounted) {
      String text = texts.elementAt(textIndex);
      if (isDeleting) {
        displayedText = text.substring(0, charIndex);
        charIndex--;
        if (charIndex == 0) {
          isDeleting = false;
          timer?.cancel();
          timer = Timer.periodic(writeDuration, (Timer t) => _updateText());
          textIndex == widget.texts.length - 1 ? textIndex = 0 : textIndex++;
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
      setState(() {});
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
