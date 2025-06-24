import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tsh_soft/core/widgets/app_image.dart';
import 'package:tsh_soft/features/home/domain/entities/slider_entity.dart';
import 'package:tsh_soft/features/home/presentation/cubit/slider_cubit/get_sliders_cubit.dart';

class HomeSlider extends StatefulWidget {
  const HomeSlider({super.key});

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  final CarouselSliderController _controller = CarouselSliderController();
  final ValueNotifier<int> pageIndexNotifier = ValueNotifier<int>(0);
  @override
  void initState() {
    BlocProvider.of<GetSlidersCubit>(context).getSliders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = ScreenUtil().screenHeight;

    return BlocBuilder<GetSlidersCubit, GetSlidersState>(
      builder: (context, state) {
        if (state is GetSlidersLoadingState) {
          return Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
                height: screenHeight * 0.27,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14.0.r),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromRGBO(60, 128, 209, .09),
                        blurRadius: 19.0,
                        offset: Offset(0, 12),
                      )
                    ])),
          );
        } else if (state is GetSlidersFailureState) {
          return Text(state.errorMessage);
        } else if (state is GetSlidersSuccessState) {
          final List<SliderEntity> offersImages =
              state.resp.data as List<SliderEntity>;
          return Column(
            children: [
              SizedBox(
                height: screenHeight * 0.28,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(60, 128, 209, .09),
                        blurRadius: 19.0,
                        offset: Offset(0, 12),
                      ),
                    ],
                  ),
                  child: CarouselSlider(
                    carouselController: _controller,
                    items: offersImages.map((slider) {
                      return Builder(
                        builder: (context) => ClipRRect(
                          borderRadius: BorderRadius.circular(14.0.r),
                          child: AppImage(
                            imageUrl: slider.image ?? '',
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                            isCached: true,
                          ),
                        ),
                      );
                    }).toList(),
                    options: CarouselOptions(
                      viewportFraction: 1.0,
                      enableInfiniteScroll: true,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      onPageChanged: (val, _) {
                        pageIndexNotifier.value = val;
                      },
                    ),
                  ),
                ),
              ),
            ],
          );
        } else {
          return Container();
        }
      },
    );
  }
}
