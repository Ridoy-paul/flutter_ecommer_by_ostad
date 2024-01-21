import 'package:flutter/material.dart';
import 'package:flutter_ecommer_by_ostad/presentation/ui/widgets/category_item_widget.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          "Categories",
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: SafeArea(
        child: GridView.builder(
            itemCount: 20,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 1,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8
            ),
            itemBuilder: (context, index) {
              return FittedBox(child: CategoryItemWidget(categoryName: "Fish"));
            }),
      ),
    );
  }
}
