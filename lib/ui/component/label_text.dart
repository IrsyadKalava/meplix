import 'package:flutter/material.dart';

class LabelText extends StatelessWidget {

  final String text;
  final double size;
  final FontWeight weight;
  final Color color;
  final TextDecoration decoration;
  final TextAlign align;
  final TextOverflow overflow;
  final int maxLine;

  const LabelText(this.text, {this.size, this.weight, this.color, this.decoration, this.align, this.overflow,  this.maxLine});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size != null ? size : 14,
        fontWeight: weight != null ? weight : FontWeight.normal,
        color: color != null ? color : Colors.black,
        decoration: decoration != null ? decoration : TextDecoration.none
      ),
      textAlign: align,
      overflow: overflow,
      maxLines: maxLine,
    );
  }
}