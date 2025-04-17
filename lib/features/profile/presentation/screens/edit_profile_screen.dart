import 'package:flutter/material.dart';
import 'package:tsh_soft/config/locale/app_localizations.dart';
import 'package:tsh_soft/core/widgets/gaps.dart';
import 'package:tsh_soft/core/widgets/text_form_field.dart';

import '../../../../core/utils/values/text_styles.dart';
import '../../../../core/widgets/my_default_button.dart';
import '../../../../injection_container.dart';
import '../widgets/edit_profile_image.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController cityController = TextEditingController();

  final FocusNode nameFocusNode = FocusNode();
  final FocusNode phoneFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode cityFocusNode = FocusNode();

  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    cityController.dispose();
    nameFocusNode.dispose();
    phoneFocusNode.dispose();
    emailFocusNode.dispose();
    cityFocusNode.dispose();
    super.dispose();
  }

  void unfocus() {
    nameFocusNode.unfocus();
    phoneFocusNode.unfocus();
    emailFocusNode.unfocus();
    cityFocusNode.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'edit_profile_info'.tr,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: EditProfileImage(),
                ),
                Gaps.vGap30,
                Text(
                  'name'.tr,
                  style: TextStyles.regular16(color: colors.main),
                ),
                Gaps.vGap10,
                AppTextFormField(
                  controller: nameController,
                  focusNode: nameFocusNode,
                  hintText: 'name'.tr,
                ),
                Gaps.vGap24,
                Text(
                  'phone'.tr,
                  style: TextStyles.regular16(color: colors.main),
                ),
                Gaps.vGap10,
                AppTextFormField(
                  controller: phoneController,
                  focusNode: phoneFocusNode,
                  hintText: 'phone'.tr,
                ),
                Gaps.vGap24,
                Text(
                  'email'.tr,
                  style: TextStyles.regular16(color: colors.main),
                ),
                Gaps.vGap10,
                AppTextFormField(
                  controller: emailController,
                  focusNode: emailFocusNode,
                  hintText: 'email'.tr,
                ),
                Gaps.vGap24,
                Text(
                  'city'.tr,
                  style: TextStyles.regular16(color: colors.main),
                ),
                Gaps.vGap10,
                AppTextFormField(
                  controller: cityController,
                  focusNode: cityFocusNode,
                  hintText: 'city'.tr,
                ),
                Gaps.vGap30,
                MyDefaultButton(
                  onPressed: () {},
                  btnText: 'edit',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
