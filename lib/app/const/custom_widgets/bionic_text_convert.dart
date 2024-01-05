import 'package:flutter/material.dart';

class BionicReader extends StatelessWidget {
  final String text;
  final TextStyle startStyle;
  final TextStyle midStyle;
  final TextStyle endStyle;

  const BionicReader({
    Key? key,
    required this.text,
    this.startStyle = const TextStyle(fontWeight: FontWeight.bold),
    this.midStyle = const TextStyle(fontWeight: FontWeight.normal),
    this.endStyle = const TextStyle(color: Colors.transparent), // Makes the end almost invisible
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final display = text.split(' ').map(_renderWord).toList(growable: false);

    return RichText(text: TextSpan(children: display));
  }

  InlineSpan _renderWord(String word) {
    if (word.length <= 2) {
      return TextSpan(text: word, style: midStyle);
    }

    final start = word.substring(0, 1);
    final mid = word.substring(1, word.length - 1);
    final end = word.substring(word.length - 1);

    return TextSpan(
      children: [
        TextSpan(text: start, style: startStyle),
        TextSpan(text: mid, style: midStyle),
        TextSpan(text: end, style: endStyle),
        const TextSpan(text: ' '), // Ensure space after each word
      ],
    );
  }
}
