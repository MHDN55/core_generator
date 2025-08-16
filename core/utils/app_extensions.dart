import 'package:flutter/material.dart' as material;
import 'package:go_router/go_router.dart';
import 'app_enums.dart';

extension NullOrEmpty on String? {
  bool nullOrEmpty() {
    if (this == null || this!.isEmpty) return true;
    return false;
  }
}

extension ChangePrintedStringColor on String {
  String withColor(StringColor? color) {
    switch (color) {
      case StringColor.black:
        return '\x1B[30m$this\x1B[0m';
      case StringColor.red:
        return '\x1B[31m$this\x1B[0m';
      case StringColor.green:
        return '\x1B[32m$this\x1B[0m';
      case StringColor.yellow:
        return '\x1B[33m$this\x1B[0m';
      case StringColor.blue:
        return '\x1B[34m$this\x1B[0m';
      case StringColor.magenta:
        return '\x1B[35m$this\x1B[0m';
      case StringColor.cyan:
        return '\x1B[36m$this\x1B[0m';
      case StringColor.white:
        return '\x1B[37m$this\x1B[0m';
      default:
        return this;
    }
  }
}

extension Navigation on material.BuildContext {
  void pushByNamed(String routeName, {Map<String, String>? pathParameters}) {
    pushNamed(routeName, pathParameters: pathParameters ?? {});
  }

  void pushReplacementByNamed(
    String routeName, {
    Map<String, String>? pathParameters,
  }) {
    return pushReplacementNamed(
      routeName,
      pathParameters: pathParameters ?? {},
    );
  }

  void goByName(String routeName, {Map<String, String>? pathParameters}) {
    goNamed(routeName, pathParameters: pathParameters ?? {});
  }

  void popPage() => pop();
}
