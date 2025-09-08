import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_haven/modules/login/cubit/states.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  bool isPassword = true;
  IconData suffix = Icons.visibility_off_outlined;

  void changeVisiblity() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit(ChangeVisiblityState());
  }

  final supabase = Supabase.instance.client.auth;

  Future<void> login({required String email, required String password}) {
    emit(LoginLoadingState());
    return supabase
        .signInWithPassword(password: password, email: email)
        .then((value) => emit(LoginSuccessState()))
        .catchError((error) {
      print(error.toString());
      emit(LoginErrorState());
    });
  }
}
