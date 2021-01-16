import 'dart:ui';

import 'package:flame/anchor.dart';
import 'package:flame/position.dart';
import 'package:flame/text_config.dart';
import 'package:flutter/material.dart';

class CenterRenderTextConfig extends TextConfig {
  CenterRenderTextConfig({
    double fontSize = 24.0,
    Color color = Colors.black,
    String fontFamily = 'Arial',
    TextAlign textAlign = TextAlign.left,
    TextDirection textDirection = TextDirection.ltr,
    double lineHeight,
  }) : super(
            fontSize: fontSize,
            color: color,
            fontFamily: fontFamily,
            textAlign: textAlign,
            textDirection: textDirection,
            lineHeight: lineHeight);

  @override
  void render(Canvas canvas, String text, Position p,
      {Anchor anchor = Anchor.topLeft}) {
    final tp = toTextPainter(text);
    final translatedPosition = anchor.translate(p, Position.fromSize(tp.size));
    translatedPosition.x -= tp.size.width / 2;
    translatedPosition.y -= tp.size.height / 2;
    tp.paint(canvas, translatedPosition.toOffset());
  }
}
