import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grading_client/root_screen.dart';
import 'package:grading_client/screen/splash_screen.dart';
import 'package:grading_client/screen/student_essay_screen.dart';
import 'package:grading_client/screen/student_multiple_choice_screen.dart';
import 'package:grading_client/screen/student_screen.dart';
import 'package:grading_client/screen/teacher_screen.dart';

class RouteName {
  static const String splash = "/splash";
  static const String root = "/root";
  static const String home = "/home";
  static const String teacher = "/teacher";
  static const String student = "/student";
  static const String studentEssay = "/student-essay";
  static const String studentMultipleChoice = "/student-multiple-choice";
}

class AppRoutes {
  static final screens = <String, Widget Function()>{
    RouteName.root: () => const RootScreen(),
    RouteName.splash: ()=> const SplashScreen(),
    RouteName.teacher: ()=> const TeacherScreen(),
    RouteName.student: ()=> const StudentScreen(),
    RouteName.studentEssay:()=>const StudentEssayScreen(),
    RouteName.studentMultipleChoice: ()=> const StudentMultipleChoiceScreen(),
  };

  static final bindings = <String, List<Bindings> Function()>{
    // RouteName.splash: () => [SplashBinding()],
    // RouteName.root: () => [RootBinding()],
  };

  static Route<Widget> generateRoute(RouteSettings settings) {
    return GetPageRoute(
      settings: settings,
      page: screens[settings.name] ?? getDefaultScreen,
      bindings: bindings[settings.name]?.call(),
    );
  }

  static Widget getDefaultScreen() => const Scaffold(
    body: Center(child: Text('Undefined')),
  );
}