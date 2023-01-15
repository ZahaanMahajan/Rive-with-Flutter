// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    Key? key,
    required this.name,
    required this.profession,
  }) : super(key: key);

  final String name, profession;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage("assets/images/profile.jpg"),
        ),
        title: Text(
          name,
          style: TextStyle(color: Colors.white),
        ),
        subtitle: Text(
          profession,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
