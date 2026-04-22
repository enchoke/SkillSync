import 'package:skillsync/core/extensions/master_state.dart';
import 'package:skillsync/helpers/api_helper.dart';
import 'package:skillsync/models/error_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'general_state.dart';

class GeneralCubit extends Cubit<MasterState<GeneralState>> {
  GeneralCubit() : super(const Initial(GeneralState()));
  final _apiHelper = ApiHelper();

  void reset() {
    emit(const Initial(GeneralState()));
  }

  Future<void> log(ErrorModel log) async {
    try {
      await _apiHelper.post(bodyMap: log.toMap(), endpoint: 'Utils/SaveErrorLog');
      emit(Loaded(state.main));
    } catch (error, stackTrace) {
      emit(Error(state.main, message: error.toString(), stackTrace: stackTrace.toString()));
    }
  }
}
