// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:rive_animation/screens/components/animated_btn.dart';
import '../components/custom_sign_in_dialog.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  bool isSignInDialogShown = false;
  late RiveAnimationController _btnAnimationController;

  @override
  void initState() {
    _btnAnimationController = OneShotAnimation(
      "active",
      autoplay: false,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Background Animation
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            width: MediaQuery.of(context).size.width * 1.7,
            bottom: 200,
            left: 100,
            child: Image.asset("assets/Backgrounds/Spline.png"),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 20,
                sigmaY: 10,
              ),
            ),
          ),
          RiveAnimation.asset("assets/RiveAssets/shapes.riv"),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 50,
                sigmaY: 50,
              ),
              child: SizedBox(),
            ),
          ),

          // Body
          AnimatedPositioned(
            top: isSignInDialogShown ? -50 : 0,
            duration: Duration(milliseconds: 240),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Spacer(),
                    SizedBox(
                      width: 260,
                      child: Column(
                        children: [
                          Text(
                            "Learn design & code",
                            style: TextStyle(
                                fontSize: 60,
                                fontFamily: "Poppins",
                                height: 1.2),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "Don't skip design. Learn design and code,"
                            " by building real apps with Flutter. Complete course about the best tools.",
                            style: TextStyle(color: Colors.grey[700]),
                          )
                        ],
                      ),
                    ),
                    Spacer(flex: 2),

                    // Animated Button Widget
                    AnimatedButton(
                      btnAnimationController: _btnAnimationController,
                      press: () {
                        _btnAnimationController.isActive = true;
                        Future.delayed(
                          Duration(milliseconds: 800),
                          () {
                            setState(() {
                              isSignInDialogShown = true;
                            });
                            customSignInDialog(context, onClosed: (_) {
                              setState(() {
                                isSignInDialogShown = false;
                              });
                            });
                          },
                        );
                      },
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24),
                      child: Text(
                        "Purchases includes access to 30+ courses, 240+ premium tutorials,"
                        " 120+ hours of videos, source files and certificates.",
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
