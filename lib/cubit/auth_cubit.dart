import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:a1_1_20/models/user.dart';
import 'package:a1_1_20/service/auth_service.dart';
import 'package:a1_1_20/service/user_service.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void signIn({required String email, required String password}) async {
    try {
      emit(AuthLoading());
      UserModel user =
          await AuthService().signIn(email: email, password: password);
      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

  void signUp({
    required String nama,
    required String email,
    required String password,
  }) async {
    try {
      emit(AuthLoading());
      UserModel user = await AuthService()
          .signUp(nama: nama, email: email, password: password);
      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

  void signOut() async {
    try {
      emit(AuthLoading());
      await AuthService().signOut();
      emit(AuthInitial());
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

  void getCurrentUser(String id) async {
    try {
      UserModel user = await UserService().getUserById(id);
      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }
}
