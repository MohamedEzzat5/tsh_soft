import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tsh_soft/config/locale/app_localizations.dart';
import 'package:tsh_soft/core/utils/values/text_styles.dart';
import 'package:tsh_soft/core/widgets/gaps.dart';
import 'package:tsh_soft/core/widgets/my_default_button.dart';
import 'package:tsh_soft/core/widgets/text_form_field.dart';
import 'package:tsh_soft/injection_container.dart';

class BillScreen extends StatefulWidget {
  const BillScreen({Key? key}) : super(key: key);

  @override
  State<BillScreen> createState() => _BillScreenState();
}

class _BillScreenState extends State<BillScreen> {
  final TextEditingController addressController = TextEditingController();
  final TextEditingController notesController = TextEditingController();
  final FocusNode addressFocusNode = FocusNode();
  final FocusNode notesFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('bill'.tr(context)),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  padding:
                      EdgeInsets.symmetric(vertical: 16.r, horizontal: 16.r),
                  decoration: BoxDecoration(
                    color: context.colors.backGround,
                    borderRadius: BorderRadius.circular(25.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'products'.tr(context),
                        style: TextStyles.semiBold16(
                            color: context.colors.textColor),
                      ),
                      Gaps.vGap10,
                      ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'اكسسوارات بناتي',
                                style: TextStyles.semiBold16(),
                              ),
                              Spacer(),
                              Text(
                                '2 x',
                                style: TextStyles.semiBold16(),
                              ),
                              Gaps.hGap10,
                              Text(
                                '1000 ${'egp'.tr(context)}',
                                style: TextStyles.semiBold16(),
                              ),
                            ],
                          );
                        },
                        separatorBuilder: (context, index) => Gaps.vGap10,
                        itemCount: 2,
                      ),
                      Divider(
                        color: context.colors.borderColor,
                        height: 30.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'delivery'.tr(context),
                            style: TextStyles.semiBold16(),
                          ),
                          Text(
                            '200 ${'egp'.tr(context)}',
                            style: TextStyles.semiBold16(),
                          ),
                        ],
                      ),
                      Divider(
                        color: context.colors.borderColor,
                        height: 30.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'payment_method'.tr(context),
                            style: TextStyles.semiBold16(),
                          ),
                          Text(
                            'cach_on_delivery'.tr(context),
                            style: TextStyles.semiBold16(),
                          ),
                        ],
                      ),
                      Divider(
                        color: context.colors.borderColor,
                        height: 30.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'total'.tr(context),
                            style: TextStyles.semiBold16(),
                          ),
                          Text(
                            '2200 ${'egp'.tr(context)}',
                            style: TextStyles.semiBold16(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Gaps.vGap20,
                Text('delivery_address'.tr(context),
                    style: TextStyles.regular16()),
                Gaps.vGap10,
                AppTextFormField(
                  controller: addressController,
                  focusNode: addressFocusNode,
                  hintText: 'delivery_address'.tr(context),
                ),
                Gaps.vGap20,
                Text('notes'.tr(context), style: TextStyles.regular16()),
                Gaps.vGap10,
                AppTextFormField(
                  controller: notesController,
                  focusNode: notesFocusNode,
                  hintText: 'notes'.tr(context),
                  maxLines: 5,
                ),
                Gaps.vGap40,
                MyDefaultButton(
                  btnText: 'send_order',
                  onPressed: () {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
