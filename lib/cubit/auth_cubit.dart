import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:pgone_apps/models/user_model.dart';
import 'package:pgone_apps/services/auth_service.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void signIn({required String username, required String password}) async {
    try {
      emit(AuthLoading());
      var accessToken = await AuthService().getToken();
      UserModel user = await AuthService().login(
        accessToken: accessToken,
        username: username,
        password: password,
      );
      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

  void signOut() async {
    try {
      emit(AuthLoading());
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

  void setInit() async {
    emit(AuthInitial());
  }
}
