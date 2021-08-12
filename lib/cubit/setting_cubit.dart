import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pgone_apps/models/employee_model.dart';
import 'package:pgone_apps/models/user_model.dart';
import 'package:pgone_apps/services/employee_service.dart';

part 'setting_state.dart';

class SettingCubit extends Cubit<SettingState> {
  SettingCubit() : super(SettingInitial());

  void getEmployeeDetails({required UserModel userModel}) async {
    try {
      emit(SettingLoading());
      EmployeeModel user = await EmployeeService().getEmployeeDetails(
          id: userModel.employeeId, accessToken: userModel.accessToken);
      emit(SettingSuccess(user));
    } catch (e) {
      emit(SettingFailed(e.toString()));
    }
  }

  void setInit() async {
    emit(SettingInitial());
  }
}
