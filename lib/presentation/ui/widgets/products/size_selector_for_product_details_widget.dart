
import 'package:flutter/material.dart';
import '../../utility/app_colors.dart';

class SizeSelector extends StatefulWidget {
  const SizeSelector({super.key, required this.size, required this.onchange});

  final List<String> size;
  final Function(String) onchange;

  @override
  State<SizeSelector> createState() => _SizeSelectorState();
}

class _SizeSelectorState extends State<SizeSelector> {
  late String _selectedSize;

  @override
  void initState() {
    super.initState();
    _selectedSize = widget.size.first;
    widget.onchange(_selectedSize);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: widget.size
          .map((s) => InkWell(
          onTap: () {
            _selectedSize = s;
            widget.onchange(s);
            if (mounted) {
              setState(() {});
            }
          },
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 2,
              horizontal: 3,
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 8),
              decoration: BoxDecoration(
                border: _selectedSize != s ? Border.all() : null,
                borderRadius: BorderRadius.circular(30),
                color: _selectedSize == s ? AppColors.primaryColor : null,

              ),

              //backgroundColor: _selectedSize == s ? AppColors.primaryColor : Colors.white,
              child: Text(s, style: TextStyle(color: _selectedSize == s ? Colors.white : Colors.grey),),
            ),
          ),
        ),
      ).toList(),
    );
  }
}