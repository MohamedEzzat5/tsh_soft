import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tsh_soft/config/locale/app_localizations.dart';
import 'package:tsh_soft/core/utils/constants.dart';
import 'package:tsh_soft/core/utils/string_extension.dart';
import 'package:tsh_soft/core/utils/svg_manager.dart';
import 'package:tsh_soft/core/utils/values/text_styles.dart';
import 'package:tsh_soft/core/widgets/app_image.dart';
import 'package:tsh_soft/core/widgets/gaps.dart';
import 'package:tsh_soft/injection_container.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int counter = 0;

  final dummyData = {
    'name': 'ايفون 13 pro max',
    'image':
        'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8V2lyZWxlc3MlMjBIZWFkcGhvbmVzfGVufDB8fDB8fHww',
    'description':
        'ايفون 13 برو ماكس مساحة 256 جيجا بايت ومقاعدة 6 اينشيت 12MP للكاميرا والكاميرا الموبايلة والكاميرا اللوكي والكاميرا اللوكي الموبايلة',
    'price': 500.00,
  };

  @override
  Widget build(BuildContext context) {
    final price = dummyData['price'] as double;

    return Scaffold(
      appBar: AppBar(
        title: Text('product_details'.tr),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  children: [
                    ProductInfoWidget(
                      name: "${dummyData['name']!}",
                      image: dummyData['image']!.toString(),
                      description: "${dummyData['description']!}",
                      price: price,
                    ),
                    Gaps.vGap20,
                    QuantitySelector(
                      counter: counter,
                      onIncrement: () => setState(() => counter++),
                      onDecrement: () {
                        if (counter > 0) setState(() => counter--);
                      },
                    ),
                    Gaps.vGap16,
                  ],
                ),
              ),
            ),
          ),
          BottomActionBar(
            totalPrice: counter * price,
            counter: counter,
          ),
        ],
      ),
    );
  }
}

class ProductInfoWidget extends StatelessWidget {
  final String name;
  final String description;
  final String image;
  final double price;

  const ProductInfoWidget({
    super.key,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: AppImage(
            imageUrl: image,
            height: 0.25.sh,
            width: 1.sw,
            borderRadius: 8.r,
            isCached: true,
            fit: BoxFit.cover,
          ),
        ),
        Gaps.vGap16,
        Row(
          children: [
            Text(name, style: TextStyles.bold18(color: colors.main)),
            const Spacer(),
            SvgPicture.asset(
              SvgAssets.heart,
              height: 28.h,
            )
          ],
        ),
        Gaps.vGap12,
        Text(
          description,
          style: TextStyles.regular14(),
          maxLines: 14,
        ),
        Gaps.vGap16,
        Container(
          padding: EdgeInsets.all(12.r),
          decoration: BoxDecoration(
            color: colors.secondaryColor,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Container(
            padding: EdgeInsets.all(16.r),
            decoration: BoxDecoration(
              color: colors.backGround,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      SvgAssets.priceIcon,
                      colorFilter: Constants.colorFilter(colors.main),
                    ),
                    Gaps.hGap4,
                    Text('price'.tr, style: TextStyles.bold14()),
                  ],
                ),
                Text('$price ${'sar'.tr}',
                    style: TextStyles.bold14(color: colors.main)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class QuantitySelector extends StatelessWidget {
  final int counter;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const QuantitySelector({
    super.key,
    required this.counter,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
          onTap: onDecrement,
          child: SizedBox(
            height: 50.h,
            width: 50.h,
            child: SvgPicture.asset(SvgAssets.minus, fit: BoxFit.none),
          ),
        ),
        Container(
          alignment: Alignment.center,
          width: 200.w,
          height: 48.h,
          decoration: BoxDecoration(
            color: colors.backGround,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Text('$counter', style: TextStyles.bold14()),
        ),
        InkWell(
          onTap: onIncrement,
          child: SizedBox(
            height: 50.h,
            width: 50.h,
            child: SvgPicture.asset(SvgAssets.plus, fit: BoxFit.none),
          ),
        ),
      ],
    );
  }
}

class BottomActionBar extends StatelessWidget {
  final double totalPrice;
  final int counter;

  const BottomActionBar({
    super.key,
    required this.totalPrice,
    required this.counter,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: colors.backGround,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400,
            blurRadius: 4,
            offset: const Offset(0, -2),
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8.r),
          topRight: Radius.circular(8.r),
        ),
      ),
      child: Row(
        children: [
          Row(
            children: [
              Text('total'.tr, style: TextStyles.bold14()),
              Gaps.hGap2,
              Text('${totalPrice.mRoundDouble(2)} ${'egp'.tr}',
                  style: TextStyles.bold14()),
            ],
          ),
          const Spacer(),
          GestureDetector(
            onTap: counter == 0
                ? () {
                    Constants.showSnakToast(
                      context: context,
                      message: 'cart_error'.tr,
                      type: 3,
                    );
                  }
                : () {
                    Constants.showSnakToast(
                      context: context,
                      message: 'تمت الإضافة بنجاح',
                      type: 1,
                    );
                  },
            child: Container(
              width: 150.w,
              padding: EdgeInsets.symmetric(horizontal: 10.r, vertical: 22.r),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: colors.main,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    SvgAssets.homeItemCart,
                  ),
                  Gaps.hGap8,
                  Text(
                    'add_to_cart'.tr,
                    style: TextStyles.bold14(color: colors.backGround),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
