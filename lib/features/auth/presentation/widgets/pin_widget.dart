import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

import '../../../../../core/utils/media_query_values.dart';
import '../../../../injection_container.dart';

class PinCodeWidget extends StatelessWidget {
  final Function(String) textSubmit;
  final TextEditingController? controller;
  final int? pinLength;
  final FocusNode? focus;
  final double? pinBoxWidth;

  const PinCodeWidget({
    super.key,
    this.controller,
    this.pinLength,
    this.focus,
    this.pinBoxWidth,
    required this.textSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: PinCodeTextField(
        pinBoxColor: context.colors.baseColor,
        autofocus: true,
        highlight: true,
        focusNode: focus,
        controller: controller,
        maxLength: pinLength!,
        pinBoxHeight: 60.h,
        pinBoxWidth: pinBoxWidth ?? MediaQueryValues(context).width * 0.12,
        pinBoxRadius: 20.0,
        pinBoxBorderWidth: 1.5,
        wrapAlignment: WrapAlignment.spaceBetween,
        pinTextAnimatedSwitcherDuration: const Duration(milliseconds: 300),
        keyboardType: TextInputType.number,
        pinTextStyle:
            Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 16),
        onTextChanged: (text) {},
        defaultBorderColor: context.colors.borderColor,
        hasTextBorderColor: context.colors.main,
        highlightColor: context.colors.main,
        pinBoxDecoration: ProvidedPinBoxDecoration.defaultPinBoxDecoration,
        onDone: (text) => textSubmit(text),
        pinBoxOuterPadding: const EdgeInsets.symmetric(horizontal: 6.0),
      ),
    );
  }
}
