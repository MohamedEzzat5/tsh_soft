import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tsh_soft/config/locale/app_localizations.dart';
import 'package:tsh_soft/core/params/address_params.dart';
import 'package:tsh_soft/core/utils/constants.dart';
import 'package:tsh_soft/core/utils/validator.dart';
import 'package:tsh_soft/core/utils/values/text_styles.dart';
import 'package:tsh_soft/core/widgets/gaps.dart';
import 'package:tsh_soft/core/widgets/loading_view.dart';
import 'package:tsh_soft/core/widgets/my_default_button.dart';
import 'package:tsh_soft/core/widgets/text_form_field.dart';
import 'package:tsh_soft/features/address/presentation/cubit/add_new_address_cubit/add_new_address_cubit.dart';

class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({Key? key}) : super(key: key);

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController titleController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController areaController = TextEditingController();
  final TextEditingController detailsController = TextEditingController();

  final FocusNode titleFocusNode = FocusNode();
  final FocusNode cityFocusNode = FocusNode();
  final FocusNode areaFocusNode = FocusNode();
  final FocusNode detailsFocusNode = FocusNode();

  void _addNewAddress() {
    if (!_formKey.currentState!.validate()) return;

    BlocProvider.of<AddNewAddressCubit>(context).addLocation(
      AddressParams(
        title: titleController.text.trim(),
        city: cityController.text.trim(),
        area: areaController.text.trim(),
        details: detailsController.text.trim(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('add_address'.tr(context)),
      ),
      body: BlocListener<AddNewAddressCubit, AddNewAddressState>(
        listener: (context, state) {
          if (state is AddLocationSuccessState) {
            Constants.showSnakToast(
                context: context, message: state.resp.message, type: 1);
            Navigator.pop(context, true);
          } else if (state is AddLocationFailureState) {
            Constants.showSnakToast(
                context: context, message: state.errorMessage, type: 3);
          }
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildLabel('title'.tr(context)),
                AppTextFormField(
                  controller: titleController,
                  focusNode: titleFocusNode,
                  textInputAction: TextInputAction.next,
                  hintText: "home/work".tr(context),
                  validatorType: ValidatorType.standard,
                ),
                Gaps.vGap12,
                _buildLabel('city'.tr(context)),
                AppTextFormField(
                  controller: cityController,
                  focusNode: cityFocusNode,
                  textInputAction: TextInputAction.next,
                  hintText: "city".tr(context),
                  validatorType: ValidatorType.standard,
                ),
                Gaps.vGap12,
                _buildLabel('area'.tr(context)),
                AppTextFormField(
                  controller: areaController,
                  focusNode: areaFocusNode,
                  textInputAction: TextInputAction.next,
                  hintText: "area".tr(context),
                  validatorType: ValidatorType.standard,
                ),
                Gaps.vGap12,
                _buildLabel('details'.tr(context)),
                AppTextFormField(
                  controller: detailsController,
                  focusNode: detailsFocusNode,
                  textInputAction: TextInputAction.done,
                  hintText: "details".tr(context),
                  validatorType: ValidatorType.standard,
                ),
                Gaps.vGap40,
                BlocBuilder<AddNewAddressCubit, AddNewAddressState>(
                  builder: (context, state) {
                    return state is AddLocationLoadingState
                        ? LoadingView()
                        : MyDefaultButton(
                            btnText: 'add_address',
                            onPressed: _addNewAddress,
                          );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: TextStyles.regular16(),
    );
  }
}
