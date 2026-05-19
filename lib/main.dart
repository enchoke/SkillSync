import 'package:skillsync/core/dependency_injection.dart';
import 'package:flutter/material.dart';
import 'package:skillsync/ui/screens/main_screen.dart';

import 'skillsync_main.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DependencyInjection.init();
  runApp(const SkillSyncMain());
}

