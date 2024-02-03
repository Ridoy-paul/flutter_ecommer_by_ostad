
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommer_by_ostad/presentation/ui/screens/product_details_screen.dart';
import '../../../../data/models/slider_list.dart';
import 'package:get/get.dart';
import '../../utility/app_colors.dart';

class HomeImageCarouselWidget extends StatefulWidget {
  const HomeImageCarouselWidget({
    super.key, this.height,
    required this.sliderList,
  });

  final double? height;
  final List<SliderItem> sliderList;

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
            height: widget.height ?? 140,
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
          items: widget.sliderList.map((slider) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      height: 150,
                      child: Stack(
                        children: <Widget>[
                          Container(
                            width: double.infinity,
                            height: double.infinity,
                            color: Colors.white,
                            child: FittedBox(
                              child: Image.network(slider.image ?? '', width: Get.width * .45,),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 2, right: 2),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    slider.title.toString() ?? '',
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    slider.shortDes.toString() ?? '',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  // ElevatedButton(
                                  //   onPressed: () {
                                  //     Get.to(() => ProductDetailsScreen());
                                  //   },
                                  //   style: ElevatedButton.styleFrom(
                                  //     backgroundColor: AppColors.primaryColor,
                                  //     fixedSize: const Size(130, 1),
                                  //     padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 10),
                                  //   ),
                                  //   child: const FittedBox(
                                  //     child: Text(
                                  //       "Buy Now",
                                  //       style: TextStyle(
                                  //         color: Colors.white,
                                  //         fontSize: 8
                                  //       ),
                                  //     ),
                                  //   ),
                                  // )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    /*
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.network(slider.image ?? '', width: Get.width * .45,),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 2, right: 2),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                 Text(
                                  slider.title.toString() ?? '',
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  slider.shortDes.toString() ?? '',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    Get.to(() => ProductDetailsScreen());
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    fixedSize: const Size(130, 25),
                                    padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
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
                    ),
                  */
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
                for(int i = 0; i < widget.sliderList.length; i++)
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