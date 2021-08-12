part of 'setting_cubit.dart';

abstract class SettingState extends Equatable {
  const SettingState();

  @override
  List<Object> get props => [];
}

class SettingInitial extends SettingState {}

class SettingLoading extends SettingState {}

class SettingSuccess extends SettingState {
  final EmployeeModel employee;

  SettingSuccess(this.employee);

  @override
  List<Object> get props => [employee];
}

class SettingFailed extends SettingState {
  final String error;

  SettingFailed(this.error);

  @override
  List<Object> get props => [error];
}
