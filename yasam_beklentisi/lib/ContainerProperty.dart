import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {
  final Color colorr;
  final Widget? child;
  final void Function()? onPress;

  MyContainer({this.colorr = Colors.white60, this.child, this.onPress});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: child,
        margin: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: colorr,
        ),
      ),
    );
  }
}
