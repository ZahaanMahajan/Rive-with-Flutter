// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({
    Key? key,
    required this.press,
    required this.riveonInit,
  }) : super(key: key);

  final VoidCallback press;
  final ValueChanged<Artboard> riveonInit;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SafeArea(
        child: Container(
          margin: EdgeInsets.only(left: 16, top: 16),
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(0, 3),
                blurRadius: 8,
              ),
            ],
          ),
          child: RiveAnimation.asset(
            "assets/RiveAssets/menu_button.riv",
            onInit: riveonInit,
          ),
        ),
      ),
    );
  }
}
