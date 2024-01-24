
import 'package:flutter/material.dart';
import 'package:flutter_ecommer_by_ostad/presentation/ui/utility/app_colors.dart';

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
            child: CircleAvatar(
              radius: 16,
              backgroundColor: _selectedSize == s ? AppColors.primaryColor : Colors.white,
              child: Text(s, style: TextStyle(color: _selectedSize == s ? Colors.white : Colors.grey),),
            ),
          ),
        ),
      )
          .toList(),
    );
  }
}