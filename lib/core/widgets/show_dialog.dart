// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<bool?> showAppDialog({
  required BuildContext context,
  required Widget child,
  double? borderRadius,
  bool isDismissible = true,
}) {
  return showDialog<bool?>(
    context: context,
    barrierDismissible: isDismissible,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 12.r),
        ),
        child: PopScope(
          onPopInvoked: (value) async => isDismissible,
          child: child,
        ),
      );
    },
  );
}
