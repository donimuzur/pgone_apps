part of 'empbirthday_cubit.dart';

abstract class EmpbirthdayState extends Equatable {
  const EmpbirthdayState();

  @override
  List<Object> get props => [];
}

class EmpbirthdayInitial extends EmpbirthdayState {}

class EmpbirthdayLoading extends EmpbirthdayState {}

class EmpbirthdaySuccess extends EmpbirthdayState {
  final List<EmployeeModel> listEmp;

  EmpbirthdaySuccess(this.listEmp);

  @override
  List<Object> get props => [listEmp];
}

class EmpbirthdayFailed extends EmpbirthdayState {
  final String error;

  EmpbirthdayFailed(this.error);

  @override
  List<Object> get props => [error];
}
