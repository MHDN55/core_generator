import 'package:flutter/foundation.dart';

import 'app_enums.dart';
import 'app_extensions.dart';

void dPrint(String? message, {StringColor? stringColor}) {
  if (kDebugMode && message != null) {
    debugPrint(message.withColor(stringColor));
  }
}
