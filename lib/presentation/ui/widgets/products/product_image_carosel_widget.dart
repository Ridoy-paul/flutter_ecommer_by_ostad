
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utility/app_colors.dart';

class ProductImageCarouselWidget extends StatefulWidget {
  const ProductImageCarouselWidget({
    super.key, this.height, required this.urls,
  });

  final double? height;
  final List<String> urls;

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
          items: widget.urls.map((url) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(url), // Example image source
                      fit: BoxFit.cover,
                    ),
                  ),
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
                  for(int i = 0; i < widget.urls.length; i++)
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