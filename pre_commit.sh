#!/bin/bash
svgo --pretty --disable=convertColors,removeViewBox --enable=removeDimensions,sortAttrs -r -f ./;
flutter format --set-exit-if-changed .;
cd ios; pod install;