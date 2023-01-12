// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AnimatedBar extends StatelessWidget {
  const AnimatedBar({
    Key? key,
    required this.isactive,
  }) : super(key: key);

  final bool isactive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.only(bottom: 2),
      height: 5,
      width: isactive ? 20 : 0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Color(0xFF81B4FF),
      ),
    );
  }
}
