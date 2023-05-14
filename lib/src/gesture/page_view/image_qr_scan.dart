import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'dart:ui' as ui;

abstract class ImageQrScanDelegate {
  void onScanImage(ui.Image image, BuildContext context);
}

class ImageQrScanCenter {
  static ImageQrScanCenter? _instance;
  static ImageQrScanCenter get instance {
    _instance ??= ImageQrScanCenter._();
    return _instance!;
  }

  static const _channel = const MethodChannel('my_channel');

  ImageQrScanCenter._();

  ImageQrScanDelegate? _delegate;
  void register(ImageQrScanDelegate delegate) {
    _delegate = delegate;
  }

  void onScanImage(ui.Image image, BuildContext context) async {
    if (_delegate != null) {
      _delegate!.onScanImage(image, context);
    }
  }
}
