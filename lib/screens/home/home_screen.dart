// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import '../../models/course.dart';
import 'components/course_card.dart';
import 'components/secondary_course_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(75, 20, 20, 20),
                child: Text(
                  "Courses",
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: Colors.black, fontWeight: FontWeight.w600),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...courses
                        .map((course) => Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: CourseCard(course: course),
                            ))
                        .toList(),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  "Recent",
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontWeight: FontWeight.w600),
                ),
              ),
              ...recentCourses.map(
                (course) => Padding(
                  padding:
                      const EdgeInsets.only(bottom: 20, right: 20, left: 20),
                  child: SecondaryCourseCard(course: course),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
