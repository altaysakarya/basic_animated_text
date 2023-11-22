## Overview
`BasicAnimatedText` is a custom Flutter widget designed to create an animated text effect where the text appears and then deletes itself character by character. This widget is ideal for creating engaging text animations in your Flutter applications.

## Buy Me A Coffee ☕️

<a href="https://www.buymeacoffee.com/altaysakarya" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/default-orange.png" alt="Buy Me A Coffee" height="41" width="174"></a>

## Features

**Customizable Texts**: Set any `List<String>` as the animated texts.
**Configurable Durations**: Specify the duration for both the writing and deleting animations.
**Custom Text Styles**: Apply any `TextStyle` to the animated text.

## Usage

Import the widget:

```dart
import 'path_to/BasicAnimatedText.dart';
```

Implement the widget in your Flutter app:

```dart
BasicAnimatedText(
  texts: "Your Animated Text Here".split(' '), //['Your', 'Animated', 'Text', 'Here']
  writeDuration: Duration(milliseconds: 150),
  deleteDuration: Duration(milliseconds: 50),
  textStyle: TextStyle(fontSize: 24, color: Colors.black),
)
```

## Parameters

`texts` (`List<String>`, required): The texts to animate.
`writeDuration` (Duration, optional): Duration for each character to be written. Default is 150 milliseconds.
`deleteDuration` (Duration, optional): Duration for each character to be deleted. Default is 50 milliseconds.
`textStyle` (TextStyle, optional): Style for the text. Default is `TextStyle(fontSize: 24)`.

## Example

<img src="https://github.com/altaysakarya/basic_animated_text/blob/main/example.gif?raw=true" height="160" width="240" alt="Example GIF">

```dart
BasicAnimatedText(
  texts: "Your Animated Text Here".split(' '), //['Your', 'Animated', 'Text', 'Here']
  writeDuration: Duration(milliseconds: 200),
  deleteDuration: Duration(milliseconds: 100),
  textStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
)
```