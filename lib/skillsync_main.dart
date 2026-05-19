import 'package:skillsync/constants/navigation_v2.dart';
import 'package:skillsync/constants/themes.dart';
import 'package:skillsync/core/dependency_injection.dart';
import 'package:skillsync/core/extensions/master_state.dart';
import 'package:skillsync/cubits/theme/theme_cubit.dart';
import 'package:skillsync/ui/widgets/global_widgets/custom_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SkillSyncMain extends StatefulWidget {
  const SkillSyncMain({super.key});

  @override
  State<SkillSyncMain> createState() => _CounterStepsMainState();
}

class _CounterStepsMainState extends State<SkillSyncMain> {
  GoRouter routerConfig = NavigationV2.router;
  @override
  Widget build(BuildContext context) {
    ErrorWidget.builder = (FlutterErrorDetails errorDetails) => CustomError(errorDetails: errorDetails);
    return GestureDetector(
      onTap: () {
        if (!FocusScope.of(context).hasPrimaryFocus) FocusManager.instance.primaryFocus!.unfocus();
      },
        child: BlocBuilder<ThemeCubit, MasterState<ThemeState>>(
          bloc: sl.themeCubit,
          builder: (context, themeState) {
            AppTheme selectedTheme = themeState.main.theme;
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              theme: SSThemes(selectedTheme).get(context),
              routerConfig: routerConfig,
            );
          },
        ),
    );
  }
}
