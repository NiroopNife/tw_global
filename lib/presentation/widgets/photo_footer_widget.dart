import 'package:flutter/material.dart';

class PhotoFooter extends StatelessWidget {
  final IconData iconType;
  final String data;

  PhotoFooter({required this.iconType, required this.data});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(iconType),
        const SizedBox(width: 5),
        Text(data)
      ],
    );
  }
}