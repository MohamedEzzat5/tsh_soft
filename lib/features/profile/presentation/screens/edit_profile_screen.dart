import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tsh_soft/config/locale/app_localizations.dart';
import 'package:tsh_soft/config/routes/app_routes.dart';
import 'package:tsh_soft/core/params/update_profile_params.dart';
import 'package:tsh_soft/core/utils/constants.dart';
import 'package:tsh_soft/core/utils/values/text_styles.dart';
import 'package:tsh_soft/core/widgets/gaps.dart';
import 'package:tsh_soft/core/widgets/loading_view.dart';
import 'package:tsh_soft/core/widgets/my_default_button.dart';
import 'package:tsh_soft/core/widgets/text_form_field.dart';
import 'package:tsh_soft/features/profile/domain/entities/profile_entity.dart';
import 'package:tsh_soft/features/profile/presentation/cubit/update_profile/update_profile_cubit.dart';

import '../../../../injection_container.dart';
import '../widgets/edit_profile_image.dart';

class EditProfileScreen extends StatefulWidget {
  final ProfileEntity profileData;
  const EditProfileScreen({super.key, required this.profileData});

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
  String? initialImageUrl;
  File? selectedImage;

  @override
  void initState() {
    super.initState();
    initialImageUrl = widget.profileData.photo;
    nameController.text = widget.profileData.name ?? '';
    phoneController.text = widget.profileData.phone ?? '';
    emailController.text = widget.profileData.email ?? '';
    cityController.text = widget.profileData.city ?? '';
  }

  @override
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
    return BlocConsumer<UpdateProfileCubit, UpdateProfileState>(
      listener: (context, state) {
        if (state is UpdateProfileSuccessState) {
          Constants.showSnakToast(
            context: context,
            message: state.response.message ?? 'Data updated successfully',
            type: 1,
          );
          // BlocProvider.of<ProfileCubit>(context).getProfile();
          Navigator.pushReplacementNamed(context, Routes.homeScreenRoute);
        } else if (state is UpdateProfileFailureState) {
          Constants.showSnakToast(
            context: context,
            message: state.errorMessage,
            type: 3,
          );
        }
      },
      builder: (context, state) {
        final isLoading = state is UpdateProfileLoadingState;

        return GestureDetector(
          onTap: unfocus,
          child: Scaffold(
            appBar: AppBar(title: Text('edit_profile_info'.tr(context))),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: CustomProfileImagePickerWidget(
                        onImageSelected: (image) {
                          selectedImage = image;
                        },
                        initialImageUrl: initialImageUrl,
                      ),
                    ),
                    Gaps.vGap30,
                    _buildField('name', nameController, nameFocusNode, context),
                    _buildField(
                        'phone', phoneController, phoneFocusNode, context),
                    _buildField(
                        'email', emailController, emailFocusNode, context),
                    _buildField('city', cityController, cityFocusNode, context),
                    Gaps.vGap30,
                    isLoading
                        ? LoadingView()
                        : MyDefaultButton(
                            btnText: 'edit',
                            onPressed: isLoading
                                ? () {}
                                : () {
                                    final old = widget.profileData;
                                    final shouldUpdateName =
                                        nameController.text.trim() !=
                                            (old.name ?? '');
                                    final shouldUpdateEmail =
                                        emailController.text.trim() !=
                                            (old.email ?? '');
                                    final shouldUpdateCity =
                                        cityController.text.trim() !=
                                            (old.city ?? '');
                                    final shouldUpdatePhoto =
                                        selectedImage != null;

                                    if (!shouldUpdateEmail &&
                                        !shouldUpdateCity &&
                                        !shouldUpdateName &&
                                        !shouldUpdatePhoto) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                            content: Text('لا يوجد تغييرات')),
                                      );
                                      return;
                                    }

                                    final params = UpdateProfileParams(
                                      name: nameController.text.trim(),
                                      email: shouldUpdateEmail
                                          ? emailController.text.trim()
                                          : old.email ?? '',
                                      city: shouldUpdateCity
                                          ? cityController.text.trim()
                                          : old.city ?? '',
                                      photoPath: shouldUpdatePhoto
                                          ? selectedImage!.path
                                          : null,
                                    );

                                    context
                                        .read<UpdateProfileCubit>()
                                        .updateProfile(params: params);
                                  },
                          ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildField(String label, TextEditingController controller,
      FocusNode focusNode, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label.tr(context),
            style: TextStyles.regular16(color: context.colors.main)),
        Gaps.vGap10,
        AppTextFormField(
          controller: controller,
          focusNode: focusNode,
          hintText: label.tr(context),
          
        ),
        Gaps.vGap24,
      ],
    );
  }
}
