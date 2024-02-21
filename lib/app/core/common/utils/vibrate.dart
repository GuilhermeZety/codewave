import 'dart:io';

import 'package:flutter_vibrate/flutter_vibrate.dart';

void vibrate(FeedbackType type) async {
  if ((Platform.isIOS || Platform.isAndroid) && await Vibrate.canVibrate) {
    Vibrate.feedback(type);
  }
}
