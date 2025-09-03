import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:home_haven/modules/login/login_screen.dart';
import 'package:home_haven/onboarding/onboarding.dart';
import 'package:home_haven/shared/bloc_observer.dart';
import 'package:home_haven/shared/styles/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
  ));

  Bloc.observer = MyBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: light,
        themeMode: ThemeMode.light,
        home: LoginScreen());
  }
}
