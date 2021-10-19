import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class CenterTextPaint extends TextPaint {
  CenterTextPaint({
    double fontSize = 24.0,
    Color color = Colors.black,
    String fontFamily = 'Arial',
    TextDirection textDirection = TextDirection.ltr,
    double? lineHeight,
  }) : super(
          config: TextPaintConfig(
            fontSize: fontSize,
            color: color,
            fontFamily: fontFamily,
            textDirection: textDirection,
            lineHeight: lineHeight,
          ),
        );

  @override
  void render(
    Canvas canvas,
    String text,
    Vector2 p, {
    Anchor anchor = Anchor.topLeft,
  }) {
    final tp = toTextPainter(text);
    final translatedPosition =
        anchor.translate(p, Vector2(tp.size.width, tp.size.height))
          ..x -= tp.size.width / 2
          ..y -= tp.size.height / 2;
    tp.paint(canvas, translatedPosition.toOffset());
  }
}
