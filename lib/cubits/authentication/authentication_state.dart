part of 'authentication_cubit.dart';

class AuthenticationState extends GlobalVars with EquatableMixin {
  final bool isLoading;
  final bool isAuthenticated;
  final AuthenticationTokenModel? authToken;

  const AuthenticationState({
    this.isLoading = false,
    this.isAuthenticated = false,
    this.authToken,
  });

  @override
  List<Object?> get props => [isLoading, isAuthenticated, authToken];

  AuthenticationState copyWith({
    bool? isLoading,
    bool? isAuthenticated,
    AuthenticationTokenModel? authToken,
  }) {
    return AuthenticationState(
      isLoading: isLoading ?? this.isLoading,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      authToken: authToken ?? this.authToken,
    );
  }
}
