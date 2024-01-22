
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utility/app_colors.dart';

class HomeImageCarouselWidget extends StatefulWidget {
  const HomeImageCarouselWidget({
    super.key, this.height,
  });

  final double? height;

  @override
  State<HomeImageCarouselWidget> createState() => _HomeImageCarouselWidgetState();
}

class _HomeImageCarouselWidgetState extends State<HomeImageCarouselWidget> {

  final ValueNotifier<int> _currentIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: widget.height ?? 180,
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
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset('assets/images/shoe.png', width: Get.width * .45,),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5, right: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Happy New Year Special Deal Save 30%",
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    fixedSize: const Size(130, 25),
                                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                                  ),
                                  child: const FittedBox(
                                    child: Text(
                                      "Buy Now",
                                      style: TextStyle(
                                          color: AppColors.primaryColor,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )

                      ],
                    )
                );
              },
            );
          }).toList(),
        ),
        ValueListenableBuilder(
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

      ],
    );
  }
}