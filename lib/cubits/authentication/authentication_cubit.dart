import 'package:skillsync/barrel_file.dart';
import 'package:skillsync/models/authentication_jwt_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<MasterState<AuthenticationState>> {

  AuthenticationCubit() : super(const Initial(AuthenticationState())) {
    authenticated(true);
  }

  void reset() {
    emit(const Initial(AuthenticationState()));
  }

  void authenticated(bool isAuthenticated) {
    emit(Loading(state.main));
    emit(Loaded(state.main.copyWith(isAuthenticated: isAuthenticated)));
  }

  void logout() {
    sl.authenticationCubit.reset();
    sl.generalCubit.reset();
    sl.screenControllerCubit.reset();
    sl.themeCubit.reset();
  }
}
