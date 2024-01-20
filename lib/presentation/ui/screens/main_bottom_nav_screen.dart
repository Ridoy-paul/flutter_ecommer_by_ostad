import 'package:flutter/material.dart';
import 'package:flutter_ecommer_by_ostad/presentation/ui/utility/app_colors.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: AppColors.lightGray,
        showUnselectedLabels: true,
        onTap: (index) {
          _selectedIndex = index;
          if(mounted) {
            setState(() {

            });
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: "Categories"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Cart"),
          BottomNavigationBarItem(icon: Icon(Icons.card_giftcard), label: "Wish"),
        ],
      ),
    );
  }
}
