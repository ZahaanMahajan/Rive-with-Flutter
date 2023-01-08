// ignore_for_file: non_constant_identifier_names

import 'package:rive/rive.dart';

class RiveUtils {
  static StateMachineController getRiveController(Artboard artboard,
      {StateMachineName = "State Machine 1"}) {
    StateMachineController? controller =
        StateMachineController.fromArtboard(artboard, StateMachineName);
    artboard.addController(controller!);
    return controller;
  }
}
