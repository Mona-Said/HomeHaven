import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_haven/modules/register/cubit/states.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  bool isPassword = true;
  IconData suffix = Icons.visibility_off_outlined;

  void changeVisiblity() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit(ChangeVisiblityState());
  }

  final supabaseAuth = Supabase.instance.client.auth;
  final supabase = Supabase.instance.client;

  void createUser({
    required String fName,
    required String lName,
    required String email,
    required String uId,
  }) {
    supabase.from('profiles').insert({
      'id': uId,
      'first_name': fName,
      'last_name': lName,
      'email': email
    }).then((value) {
      emit(CreateAccountSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(CreateAccountErrorState());
    });
  }

  Future<void> register({
    required String email,
    required String password,
    required String fName,
    required String lName,
  }) {
    emit(RegisterLoadingState());
    return supabaseAuth
        .signUp(
      password: password,
      email: email,
    )
        .then((value) {
      createUser(fName: fName, lName: lName, uId: value.user!.id, email: email);
      emit(RegisterSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(RegisterErrorState());
    });
  }
}
