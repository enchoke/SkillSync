import 'package:equatable/equatable.dart';

class PasswordValidation extends Equatable {
  final bool hasRequiredLength;
  final bool hasLetter;
  final bool hasSpecialCharacter;
  final bool hasUpperCase;
  final bool hasLowerCase;

  const PasswordValidation({
    this.hasRequiredLength = false,
    this.hasLetter = false,
    this.hasSpecialCharacter = false,
    this.hasUpperCase = false,
    this.hasLowerCase = false,
  });

  @override
  List<Object?> get props => [
    hasRequiredLength,
    hasLetter,
    hasSpecialCharacter,
    hasUpperCase,
    hasLowerCase,
  ];

  PasswordValidation copyWith({
    bool? hasRequiredLength,
    bool? hasLetter,
    bool? hasSpecialCharacter,
    bool? hasUpperCase,
    bool? hasLowerCase,
  }) {
    return PasswordValidation(
      hasRequiredLength: hasRequiredLength ?? this.hasRequiredLength,
      hasLetter: hasLetter ?? this.hasLetter,
      hasSpecialCharacter: hasSpecialCharacter ?? this.hasSpecialCharacter,
      hasUpperCase: hasUpperCase ?? this.hasUpperCase,
      hasLowerCase: hasLowerCase ?? this.hasLowerCase,
    );
  }
}
