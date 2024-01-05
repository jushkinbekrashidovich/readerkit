import 'package:flutter/material.dart';

class BionicReader extends StatelessWidget {
  final String text;
  final TextStyle startStyle;
  final TextStyle midStyle;
  final double wordSpacingFactor; // New property for word spacing

  const BionicReader({
    Key? key,
    required this.text,
    this.startStyle = const TextStyle(fontWeight: FontWeight.bold),
    this.midStyle = const TextStyle(fontWeight: FontWeight.normal),
    this.wordSpacingFactor = 1.0, // Default word spacing factor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final display = text.split(' ').map(_renderWord).toList(growable: false);

    return RichText(
      text: TextSpan(children: display),
      textScaleFactor: wordSpacingFactor,
      textAlign: TextAlign.justify,
      
    );
  }

  InlineSpan _renderWord(String word) {
    final halfLength = (word.length / 2).ceil();
    final start = word.substring(0, halfLength);
    final mid = word.substring(halfLength);

    return TextSpan(
      children: [
        TextSpan(text: start, style: startStyle),
        TextSpan(text: mid, style: midStyle),
        const TextSpan(text: ' '), // Ensure space after each word
      ],
    );
  }
}
