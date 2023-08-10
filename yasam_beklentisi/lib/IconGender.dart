import 'package:flutter/material.dart';
import './constants.dart';

class ColumnWidget extends StatelessWidget {
  final String? gender;

  final IconData? icon;

  ColumnWidget({this.icon, this.gender});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 50, color: Colors.black54),
        SizedBox(
          height: 10,
        ),
        Text(gender!, style: textStyle),
      ],
    );
  }
}
