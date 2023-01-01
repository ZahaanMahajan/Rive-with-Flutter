// ignore_for_file: prefer_const_constructorsa  QWzxeD, prefer_const_constructors, sort_child_properties_last

// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rive/rive.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({
    Key? key,
  }) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // Future signIn() async {
  //   // showDialog(
  //   //   context: context,
  //   //   builder: (context) {
  //   //     return Center(
  //   //       child: CircularProgressIndicator(),
  //   //     );
  //   //   },
  //   // );

  //   await FirebaseAuth.instance.signInWithEmailAndPassword(
  //     email: _emailController.text.trim(),
  //     password: _passwordController.text.trim(),
  //   );

  //   // Navigator.of(context).pop();
  // }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isShowLoading = false;
  bool isShowConfetti = false;

  late SMITrigger check;
  late SMITrigger error;
  late SMITrigger reset;
  late SMITrigger confetti;

  StateMachineController getRiveController(Artboard artboard) {
    StateMachineController? controller =
        StateMachineController.fromArtboard(artboard, "State Machine 1");
    artboard.addController(controller!);
    return controller;
  }

  void signIn(BuildContext context) {
    setState(() {
      isShowLoading = true;
      isShowConfetti = true;
    });
    Future.delayed(
      Duration(seconds: 1),
      () {
        if (_formKey.currentState!.validate()) {
          check.fire();
          Future.delayed(
            Duration(seconds: 2),
            () {
              setState(() {
                isShowLoading = false;
              });
              setState(() {
                isShowConfetti = true;
              });
              confetti.fire();
            },
          );
        } else {
          error.fire();
          Future.delayed(Duration(seconds: 2), () {
            setState(
              () {
                isShowLoading = false;
              },
            );
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "E-mail",
                style: TextStyle(color: Colors.grey[700]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 16),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "";
                    }
                    return null;
                  },
                  onSaved: (email) {
                    if (_formKey.currentState!.validate()) {}
                  },
                  controller: _emailController,
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: SvgPicture.asset("assets/icons/email.svg"),
                    ),
                  ),
                ),
              ),
              Text(
                "Password",
                style: TextStyle(color: Colors.grey[700]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 16),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "";
                    }
                    return null;
                  },
                  onSaved: (password) {},
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: SvgPicture.asset("assets/icons/password.svg"),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 24),
                child: ElevatedButton.icon(
                  onPressed: () {
                    signIn(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFF77D8E),
                    minimumSize: Size(double.infinity, 56),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(25),
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25),
                      ),
                    ),
                  ),
                  icon: Icon(
                    CupertinoIcons.arrow_right,
                    color: Color(0xFFFE0037),
                  ),
                  label: Text("Sign In"),
                ),
              ),
            ],
          ),
        ),
        isShowLoading
            ? CustomPositioned(
                child: RiveAnimation.asset(
                  "assets/RiveAssets/check.riv",
                  onInit: (artboard) {
                    StateMachineController controller =
                        getRiveController(artboard);
                    check = controller.findSMI("Check") as SMITrigger;
                    reset = controller.findSMI("Reset") as SMITrigger;
                    error = controller.findSMI("Error") as SMITrigger;
                  },
                ),
                size: 100)
            : SizedBox(),
        isShowConfetti
            ? CustomPositioned(
                child: Transform.scale(
                  scale: 6,
                  child: RiveAnimation.asset(
                    "assets/RiveAssets/confetti.riv",
                    onInit: (artboard) {
                      StateMachineController controller =
                          getRiveController(artboard);
                      confetti =
                          controller.findSMI("Trigger explosion") as SMITrigger;
                    },
                  ),
                ),
              )
            : SizedBox(),
      ],
    );
  }
}

class CustomPositioned extends StatelessWidget {
  const CustomPositioned({super.key, required this.child, this.size = 100});

  final Widget child;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Column(
        children: [
          Spacer(),
          SizedBox(
            height: size,
            width: size,
            child: child,
          ),
          Spacer(flex: 2),
        ],
      ),
    );
  }
}
