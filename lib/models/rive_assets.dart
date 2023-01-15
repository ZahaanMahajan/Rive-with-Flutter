import 'package:rive/rive.dart';

class RiveAsset {
  final String artboard, stateMachineName, title;
  SMIBool? input;

  RiveAsset({
    required this.artboard,
    required this.stateMachineName,
    required this.title,
  });

  set setInput(SMIBool status) {
    input = status;
  }
}

List<RiveAsset> bottomNavs = [
  RiveAsset(
    artboard: "CHAT",
    stateMachineName: "CHAT_Interactivity",
    title: "Chat",
  ),
  RiveAsset(
    artboard: "SEARCH",
    stateMachineName: "SEARCH_Interactivity",
    title: "Search",
  ),
  RiveAsset(
    artboard: "TIMER",
    stateMachineName: "TIMER_Interactivity",
    title: "Timer",
  ),
  RiveAsset(
    artboard: "BELL",
    stateMachineName: "BELL_Interactivity",
    title: "Notifications",
  ),
  RiveAsset(
    artboard: "USER",
    stateMachineName: "USER_Interactivity",
    title: "Profile",
  ),
];

List<RiveAsset> sideMenus = [
  RiveAsset(
    artboard: "HOME",
    stateMachineName: "HOME_interactivity",
    title: "Home",
  ),
  RiveAsset(
    artboard: "SEARCH",
    stateMachineName: "SEARCH_Interactivity",
    title: "Search",
  ),
  RiveAsset(
    artboard: "LIKE/STAR",
    stateMachineName: "STAR_Interactivity",
    title: "Favorites",
  ),
  RiveAsset(
    artboard: "CHAT",
    stateMachineName: "CHAT_Interactivity",
    title: "Help",
  ),
];

List<RiveAsset> sideMenus2 = [
  RiveAsset(
    artboard: "TIMER",
    stateMachineName: "TIMER_Interactivity",
    title: "History",
  ),
  RiveAsset(
    artboard: "BELL",
    stateMachineName: "BELL_Interactivity",
    title: "Notification",
  ),
];
