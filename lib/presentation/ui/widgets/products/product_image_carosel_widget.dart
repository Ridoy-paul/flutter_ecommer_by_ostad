
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utility/app_colors.dart';

class ProductImageCarouselWidget extends StatefulWidget {
  const ProductImageCarouselWidget({
    super.key, this.height,
  });

  final double? height;

  @override
  State<ProductImageCarouselWidget> createState() => _ProductImageCarouselWidgetState();
}

class _ProductImageCarouselWidgetState extends State<ProductImageCarouselWidget> {

  final ValueNotifier<int> _currentIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: widget.height ?? 220,
            aspectRatio: 16/9,
            viewportFraction: 1,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            enlargeFactor: 0.3,
            onPageChanged: (index, reason) {
              _currentIndex.value = index;
            },
            scrollDirection: Axis.horizontal,
          ),
          items: [1,2,3,4,5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      color: AppColors.lightGray,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset('assets/images/shoe.png', width: Get.width * .65,),

                      ],
                    )
                );
              },
            );
          }).toList(),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 5,
          child: ValueListenableBuilder(
            valueListenable: _currentIndex,
            builder: (context, index, __) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for(int i = 0; i < 5; i++)
                    Container(
                      width: 16.0,
                      height: 16.0,
                      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: i == index ? AppColors.primaryColor : Colors.white,
                        border: Border.all(
                          color: i == index ? AppColors.primaryColor : Colors.grey,
                        )
                      ),
                    )
                ],
              );
            }
          ),
        ),

      ],
    );
  }
}