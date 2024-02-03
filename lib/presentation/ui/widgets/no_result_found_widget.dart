import 'package:flutter/material.dart';
import '../../../generated/assets.dart';
import '../utility/app_colors.dart';

class NoResultFoundWidget extends StatelessWidget {
  const NoResultFoundWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(Assets.noResultFound),
            const Text("Sorry, No Result Found!", style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: AppColors.primaryColor),)
          ],
        ),
      ),
    );
  }
}