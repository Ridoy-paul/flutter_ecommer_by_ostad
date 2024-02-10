
import 'package:flutter/material.dart';

class ColorSelector extends StatefulWidget {
  const ColorSelector({super.key, required this.colors, required this.onchange});

  final List<Color> colors;
  final Function(Color) onchange;

  @override
  State<ColorSelector> createState() => _ColorSelectorState();
}

class _ColorSelectorState extends State<ColorSelector> {
  late Color _selectedColor;

  @override
  void initState() {
    super.initState();
    _selectedColor = widget.colors.first;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: widget.colors
          .map(
            (c) => InkWell(
          onTap: () {
            _selectedColor = c;
            widget.onchange(c);
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
            child:Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.grey,
                  width: 1,
                ),
              ),
              child: CircleAvatar(
                radius: 16,
                backgroundColor: c,
                child: _selectedColor == c
                    ? const Icon(
                  Icons.done,
                  color: Colors.white,
                )
                    : null,
              ),
            )
            ,
          ),
        ),
      )
          .toList(),
    );
  }
}