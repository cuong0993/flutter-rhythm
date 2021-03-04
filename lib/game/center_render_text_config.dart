import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class CenterRenderTextConfig extends TextConfig {
  CenterRenderTextConfig({
    double fontSize = 24.0,
    Color color = Colors.black,
    String fontFamily = 'Arial',
    TextAlign textAlign = TextAlign.left,
    TextDirection textDirection = TextDirection.ltr,
    double? lineHeight,
  }) : super(
            fontSize: fontSize,
            color: color,
            fontFamily: fontFamily,
            textAlign: textAlign,
            textDirection: textDirection,
            lineHeight: lineHeight);

  @override
  void render(
    Canvas canvas,
    String text,
    Vector2 p, {
    Anchor anchor = Anchor.topLeft,
  }) {
    final tp = toTextPainter(text);
    final translatedPosition =
        anchor.translate(p, Vector2(tp.size.width, tp.size.height));
    translatedPosition.x -= tp.size.width / 2;
    translatedPosition.y -= tp.size.height / 2;
    tp.paint(canvas, translatedPosition.toOffset());
  }
}
