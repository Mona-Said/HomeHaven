import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:home_haven/modules/login/login_screen.dart';
import 'package:home_haven/shared/bloc_observer.dart';
import 'package:home_haven/shared/styles/themes.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://swpbybulragefklvodtm.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InN3cGJ5YnVscmFnZWZrbHZvZHRtIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTcxMTIzMjIsImV4cCI6MjA3MjY4ODMyMn0.QDyHslMpgGvEbdT-7kx_lBdOIHbtRMboodFC84vlp0g',
  );

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
