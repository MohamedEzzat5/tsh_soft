
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tsh_soft/core/utils/constants.dart';
import 'package:tsh_soft/core/utils/svg_manager.dart';
import 'package:tsh_soft/injection_container.dart';

class OnboardingButton extends StatelessWidget {
  final VoidCallback onPressed;

  const OnboardingButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(colors.white),
          shape: WidgetStateProperty.all(const CircleBorder()),
        ),
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: SvgPicture.asset(
            SvgAssets.arrow,
            colorFilter: Constants.colorFilter(colors.main),
          ),
        ),
      ),
    );
  }
}
