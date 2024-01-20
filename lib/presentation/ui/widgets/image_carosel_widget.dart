
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommer_by_ostad/presentation/ui/utility/app_colors.dart';

class ImageCaroselWidget extends StatefulWidget {
  const ImageCaroselWidget({
    super.key, this.height,
  });

  final double? height;

  @override
  State<ImageCaroselWidget> createState() => _ImageCaroselWidgetState();
}

class _ImageCaroselWidgetState extends State<ImageCaroselWidget> {

  final ValueNotifier<int> _index = ValueNotifier(0);

  int _currentIndex = 0;

  final List<String> images = [
    'assets/image1.jpg',
    'assets/image2.jpg',
    'assets/image3.jpg',
    // Add more image paths as needed
  ];


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: widget.height ?? 180,
            aspectRatio: 16/2,
            viewportFraction: 0.8,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            enlargeFactor: 0.3,
            onPageChanged: (index, reason) {

            },
            scrollDirection: Axis.horizontal,
          ),
          items: [1,2,3,4,5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text('text $i', style: TextStyle(fontSize: 16.0),)
                );
              },
            );
          }).toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for(int i = 0; i < 5; i++)
              Container(
                width: 16.0,
                height: 16.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: i == _index.value ? AppColors.primaryColor : Colors.white,
                  border: Border.all(
                    color: i == _index.value ? AppColors.primaryColor : Colors.grey,
                  )
                ),
              )
          ],
        ),

      ],
    );
  }
}