import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tsh_soft/config/locale/app_localizations.dart';

import '../../../../core/utils/image_manager.dart';
import '../../../../core/utils/validator.dart';
import '../../../../core/utils/values/text_styles.dart';
import '../../../../core/widgets/gaps.dart';
import '../../../../core/widgets/my_default_button.dart';
import '../../../../core/widgets/tags_text_form_field.dart';
import '../../../../injection_container.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  final TextEditingController suggestionsController = TextEditingController();
  final FocusNode suggestionsfocusNode = FocusNode();
  final TextEditingController nameController = TextEditingController();
  final FocusNode nameFocus = FocusNode();
  final TextEditingController emailController = TextEditingController();
  final FocusNode emailFocus = FocusNode();
  final TextEditingController phoneController = TextEditingController();
  final FocusNode phoneFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => unFocus(),
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(70.h),
            child: AppBar(
              title: Text('contactUs'.tr),
            )),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16.r),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(
                      ImgAssets.contactUs,
                      height: 200.h,
                      width: 200.w,
                    ),
                  ),
                  Gaps.vGap22,
                  Text(
                    'name'.tr,
                    style: TextStyles.regular14(color: colors.main),
                  ),
                  Gaps.vGap8,
                  AppTextFormField(
                    controller: nameController,
                    focusNode: nameFocus,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    validatorType: ValidatorType.name,
                    hintText: 'name'.tr,
                  ),
                  Gaps.vGap15,
                  Text(
                    'email'.tr,
                    style: TextStyles.regular14(color: colors.main),
                  ),
                  Gaps.vGap8,
                  AppTextFormField(
                    controller: emailController,
                    focusNode: emailFocus,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    validatorType: ValidatorType.email,
                    hintText: 'email'.tr,
                  ),
                  Gaps.vGap15,
                  Text(
                    'phone_number'.tr,
                    style: TextStyles.regular14(color: colors.main),
                  ),
                  Gaps.vGap8,
                  AppTextFormField(
                    controller: phoneController,
                    focusNode: phoneFocus,
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.next,
                    validatorType: ValidatorType.phone,
                    hintText: 'phone_number'.tr,
                  ),
                  Gaps.vGap15,
                  Text(
                    'message'.tr,
                    style: TextStyles.regular14(color: colors.main),
                  ),
                  Gaps.vGap8,
                  AppTextFormField(
                    maxLines: 5,
                    controller: suggestionsController,
                    focusNode: suggestionsfocusNode,
                    validatorType: ValidatorType.textOnly,
                    hintText: 'message'.tr,
                  ),
                  Gaps.vGap40,
                  MyDefaultButton(
                    onPressed: () {
                      onSendPressed(context);
                    },
                    btnText: 'send',
                    textColor: colors.white,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onSendPressed(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
    }
  }

  void unFocus() {
    nameFocus.unfocus();
    emailFocus.unfocus();
    phoneFocus.unfocus();
    suggestionsfocusNode.unfocus();
  }
}
