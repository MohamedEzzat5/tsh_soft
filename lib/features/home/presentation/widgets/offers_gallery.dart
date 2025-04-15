import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tsh_soft/core/widgets/diff_img.dart';

class OffersGallery extends StatefulWidget {
  const OffersGallery({super.key});

  @override
  State<OffersGallery> createState() => _OffersGalleryState();
}

class _OffersGalleryState extends State<OffersGallery> {
  final CarouselSliderController _controller = CarouselSliderController();
  final ValueNotifier<int> pageIndexNotifier = ValueNotifier<int>(0);

  final List<String> offersImages = [
    "https://images.unsplash.com/photo-1517336714731-489689fd1ca8",
    "https://images.unsplash.com/photo-1517336714731-489689fd1ca8",
    "https://images.unsplash.com/photo-1517336714731-489689fd1ca8",
  ];

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

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
                    child: DiffImage(
                      image: imageUrl,
                      width: double.infinity,
                      height: double.infinity,
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
