import 'package:rive/rive.dart';

class RiveAsset {
  final String artboard, stateMachineName, title;
  SMIBool? input;

  RiveAsset(
    this.artboard,
    this.stateMachineName,
    this.title,
  );

  set setInput(SMIBool status) {
    input = status;
  }
}

List<RiveAsset> bottomNavs = [
  RiveAsset("CHAT", "CHAT_Interactivity", "Chat"),
  RiveAsset("SEARCH", "SEARCH_Interactivity", "Search"),
  RiveAsset("TIMER", "TIMER_Interactivity", "Timer"),
  RiveAsset("BELL", "BELL_Interactivity", "Notifications"),
  RiveAsset("USER", "USER_Interactivity", "Profile"),
];
