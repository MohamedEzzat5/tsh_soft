import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tsh_soft/core/widgets/app_image.dart';

class HomeGallery extends StatefulWidget {
  const HomeGallery({super.key});

  @override
  State<HomeGallery> createState() => _HomeGalleryState();
}

class _HomeGalleryState extends State<HomeGallery> {
  final CarouselSliderController _controller = CarouselSliderController();
  final ValueNotifier<int> pageIndexNotifier = ValueNotifier<int>(0);

  final List<String> offersImages = [
    "https://plus.unsplash.com/premium_photo-1683141052679-942eb9e77760?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8c2hvcHBpbmd8ZW58MHx8MHx8fDA%3D",
    "https://images.unsplash.com/photo-1555529669-e69e7aa0ba9a?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8c2hvcHBpbmd8ZW58MHx8MHx8fDA%3D",
    "https://images.unsplash.com/photo-1441986300917-64674bd600d8?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8Y2xvdGhpbmclMjBzdG9yZXxlbnwwfHwwfHx8MA%3D%3D",
  ];

  @override
  Widget build(BuildContext context) {
    double screenHeight = ScreenUtil().screenHeight;

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
              items: offersImages.map((imageUrl) {
                return Builder(
                  builder: (context) => ClipRRect(
                    borderRadius: BorderRadius.circular(14.0.r),
                    child: AppImage(
                      imageUrl: imageUrl,
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
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                onPageChanged: (val, _) {
                  pageIndexNotifier.value = val;
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}