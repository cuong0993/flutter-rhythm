#!/bin/bash
find . -name "*.g.dart" -type f -delete;
find . -name "*.gr.dart" -type f -delete;
find . -name "*.freezed.dart" -type f -delete;
flutter packages pub run build_runner build --delete-conflicting-outputs
