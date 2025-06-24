import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart'; // ✅ Add this to render HTML
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tsh_soft/config/locale/app_localizations.dart';
import 'package:tsh_soft/core/params/page_params.dart';
import 'package:tsh_soft/core/utils/constants.dart';
import 'package:tsh_soft/core/widgets/gaps.dart';
import 'package:tsh_soft/features/pages/domain/entities/page_entity.dart';
import 'package:tsh_soft/features/pages/presentation/cubit/get_page_cubit.dart';
import 'package:tsh_soft/injection_container.dart';
import '../../../../core/utils/image_manager.dart';
import '../../../../core/utils/svg_manager.dart';
import '../../../../core/utils/values/text_styles.dart';


class TermsAndConditionsScreen extends StatefulWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  State<TermsAndConditionsScreen> createState() =>
      _TermsAndConditionsScreenState();
}

class _TermsAndConditionsScreenState extends State<TermsAndConditionsScreen> {
  @override
  void initState() {
    BlocProvider.of<GetPageCubit>(context)
        .getPage(params: PageParams(slug: 'terms'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('terms_conditions'.tr(context)),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: BlocBuilder<GetPageCubit, GetPageState>(
            builder: (context, state) {
              if (state is GetPageLoadingState) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is GetPageFailureState) {
                return Center(child: Text(state.errorMessage));
              } else if (state is GetPageSuccessState) {
                final page = state.resp.data as PageEntity;
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Gaps.vGap25,
                      Center(
                        child: Image.asset(
                          ImgAssets.logo,
                          height: 135.h,
                        ),
                      ),
                      Gaps.vGap40,
                      Row(
                        children: [
                          SvgPicture.asset(
                            SvgAssets.about_us,
                            height: 33.h,
                            colorFilter: Constants.colorFilter(
                              context.colors.main,
                            ),
                          ),
                          Gaps.hGap8,
                          Text(
                            page.title ?? '',
                            style:
                                TextStyles.bold20(color: context.colors.main),
                          )
                        ],
                      ),
                      const SizedBox(height: 24),
                      Html(data: page.content ?? ''),
                    ],
                  ),
                );
              } else {
                return const SizedBox.shrink(); // Fallback empty
              }
            },
          ),
        ),
      ),
    );
  }
}
