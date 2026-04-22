import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:skillsync/barrel_file.dart';

part 'screen_controller_state.dart';

class ScreenControllerCubit extends Cubit<MasterState<ScreenControllerState>> {
  ScreenControllerCubit() : super(const Initial(ScreenControllerState()));

  void go(MainScreens screen) {
    if (state.main.availableScreens.contains(screen)) emit(Message(state.main.copyWith(currentScreen: screen)));
  }

  void reset() {
    emit(const Initial(ScreenControllerState()));
  }

  void updateAvailableScreens() {
    List<MainScreens> screens = MainScreens.values.toList();
    emit(Message(state.main.copyWith(availableScreens: screens)));
  }
}
