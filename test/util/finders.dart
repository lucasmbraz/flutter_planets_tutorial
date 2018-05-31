import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Finder findImage(String imageDesc) {
  return find.byWidgetPredicate((Widget widget) {
    if (widget is Image) {
      if (widget.image is AssetImage) {
        AssetImage assetImage = widget.image;
        return imageDesc == assetImage.assetName;
      }
    }
    return false;
  });
}