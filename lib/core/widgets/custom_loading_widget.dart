import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tsh_soft/injection_container.dart';

class AppCustomLoading extends StatelessWidget {
  final double? loadingSize;
  const AppCustomLoading({
    super.key,
    this.loadingSize,
  });

  @override
  Widget build(BuildContext context) {
    return LoadingAnimationWidget.inkDrop(
      color: colors.main,
      size: loadingSize ?? 50.r,
    );
  }
}
