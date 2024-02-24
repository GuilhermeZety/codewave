import 'package:flutter/material.dart';
import 'package:codewave_systems/app/core/common/extensions/context_extension.dart';

Future<T?> showCustomDialog<T>(
  BuildContext context, {
  required Widget child,
}) async {
  return showModalBottomSheet<T>(
    context: context,
    backgroundColor: Colors.transparent,
    constraints: BoxConstraints(
      maxHeight: context.height * 0.95,
      minHeight: context.height * 0.4,
    ),
    isDismissible: true,
    isScrollControlled: true,
    enableDrag: true,
    elevation: 0,
    builder: (context) => child,
  );
}
