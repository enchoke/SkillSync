import 'package:skillsync/barrel_file.dart';
import 'package:flutter/material.dart';
import 'package:skillsync/ui/screens/main_screens/about/about_screen.dart';
import 'package:skillsync/ui/screens/main_screens/home/home_screen.dart';


const String cLive = 'https://';
const String cDebug = 'https://';
const bool cIsLive = false;

extension WebScreenExtension on MainScreens {
  Widget get view {
    switch (this) {
      case MainScreens.home:
        return const HomeScreen();
      case MainScreens.about:
        return const AboutScreen();
    }
  }
}
