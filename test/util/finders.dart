import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Finder findAssetImage(String assetName) {
  return find.byWidgetPredicate((Widget widget) {
    if (widget is Image && widget.image is AssetImage) {
      AssetImage assetImage = widget.image;
      return assetImage.assetName == assetName;
    }
    return false;
  });
}

Finder findNetworkImage(String url) {
  return find.byWidgetPredicate((Widget widget) {
    if (widget is Image && widget.image is NetworkImage) {
      NetworkImage networkImage = widget.image;
      return networkImage.url == url;
    }
    return false;
  });
}
