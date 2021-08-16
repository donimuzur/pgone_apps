import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pgone_apps/models/employee_model.dart';
import 'package:pgone_apps/models/user_model.dart';
import 'package:pgone_apps/services/employee_service.dart';

part 'empbirthday_state.dart';

class EmpbirthdayCubit extends Cubit<EmpbirthdayState> {
  EmpbirthdayCubit() : super(EmpbirthdayInitial());

  void getEmployeeBirthday({required AccessToken accessToken}) async {
    try {
      emit(EmpbirthdayLoading());
      List<EmployeeModel> user =
          await EmployeeService().getBirthdayEmployee(accessToken: accessToken);
      emit(EmpbirthdaySuccess(user));
    } catch (e) {
      emit(EmpbirthdayFailed(e.toString()));
    }
  }

  void setInit() async {
    try {
      emit(EmpbirthdayInitial());
    } catch (e) {
      emit(EmpbirthdayFailed(e.toString()));
    }
  }
}
