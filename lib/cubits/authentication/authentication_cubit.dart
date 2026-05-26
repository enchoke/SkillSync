import 'dart:async';
import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:skillsync/barrel_file.dart';
import 'package:skillsync/models/authentication_jwt_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<MasterState<AuthenticationState>> {
  final SupabaseClient _supabase = Supabase.instance.client;

  StreamSubscription<AuthState>? _authStateSubscription;

  AuthenticationCubit() : super(const Initial(AuthenticationState())) {
    monitorAuthState();
  }

  void monitorAuthState() {
    _authStateSubscription =
        _supabase.auth.onAuthStateChange.listen((data) {
      final session = data.session;

      if (session != null) {
        emit(Loaded(state.main.copyWith(isAuthenticated: true)));
      } else {
        emit(Loaded(
          state.main.copyWith(
            isAuthenticated: false,
            authToken: null,
          ),
        ));
      }
    });
  }

  void reset() {
    emit(const Initial(AuthenticationState()));
  }

  Future<void> signInWithEmail(String email, String password) async {
    emit(Loading(state.main));

    try {
      final response = await _supabase.auth.signInWithPassword(
        email: email.trim(),
        password: password.trim(),
      );

      if (response.user != null) {
        emit(Loaded(state.main.copyWith(isAuthenticated: true)));
      }
    } on AuthException catch (e) {
      emit(Error(state.main,
          message: e.message));
    } catch (e) {
      emit(Error(state.main,
          message: "An unexpected error occurred."));
    }
  }

  Future<void> signUpWithEmail(
      String email,
      String password,
      String fullName,
      ) async {

    emit(Loading(state.main));

    try {
      final response = await _supabase.auth.signUp(
        email: email.trim(),
        password: password.trim(),
        data: {
          'full_name': fullName,
        },
      );

      if (response.user != null) {

        await _supabase.from('users').upsert({
          'id': response.user!.id,
          'email': email.trim(),
          'full_name': fullName,
        });

        emit(Loaded(
          state.main.copyWith(isAuthenticated: true),
        ));
      }

    } on AuthException catch (e) {

      emit(Error(
        state.main,
        message: e.message,
      ));

    } catch (e) {
      debugPrint('SIGN UP ERROR: $e');
      emit(Error(
        state.main,
        message: e.toString(),
      ));
    }
  }

  Future<void> logout() async {
    emit(Loading(state.main));

    try {

      await _supabase.auth.signOut();

      sl.authenticationCubit.reset();
      sl.generalCubit.reset();
      sl.screenControllerCubit.reset();
      sl.themeCubit.reset();

    } catch (e) {

      emit(Error(
        state.main,
        message: "An error occurred during logout.",
      ));
    }
  }

  @override
  Future<void> close() {
    _authStateSubscription?.cancel();
    return super.close();
  }
}