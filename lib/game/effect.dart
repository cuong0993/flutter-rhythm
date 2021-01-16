import 'package:flutter/cupertino.dart';

abstract class Effect {
  bool isDone() {
    return false;
  }

  void update(double delta) {}

  void render(Canvas canvas) {}
}
