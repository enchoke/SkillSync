import 'package:skillsync/barrel_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainHomeScreen extends StatelessWidget {
  const MainHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return BlocBuilder<ScreenControllerCubit, MasterState<ScreenControllerState>>(
      bloc: sl.screenControllerCubit,
      builder: (context, state) {
        return Scaffold(
          key: scaffoldKey,
          body: state.main.currentScreen.view,
        );
      },
    );
  }
}
