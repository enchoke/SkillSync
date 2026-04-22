part of 'general_cubit.dart';

class GeneralState extends GlobalVars with EquatableMixin {
  final bool isLoading;

  const GeneralState({this.isLoading = false});

  @override
  List<Object?> get props => [isLoading];

  GeneralState copyWith({bool? isLoading}) {
    return GeneralState(isLoading: isLoading ?? this.isLoading);
  }
}
