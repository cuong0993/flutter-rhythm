import 'package:flutter/material.dart';

abstract class Effect {
  bool isDone() {
    return false;
  }

  void update(double delta) {}

  void render(Canvas canvas) {}
}
