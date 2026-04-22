part of 'theme_cubit.dart';

enum AppTheme { dark, light }

class ThemeState extends GlobalVars with EquatableMixin {
  final AppTheme theme;

  const ThemeState({this.theme = AppTheme.dark});

  @override
  List<Object?> get props => [theme];

  ThemeState copyWith({AppTheme? theme}) {
    return ThemeState(theme: theme ?? this.theme);
  }
}
