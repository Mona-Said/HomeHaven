import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_haven/cubit/states.dart';
import 'package:home_haven/modules/cart/cart_screen.dart';
import 'package:home_haven/modules/home/home_screen.dart';
import 'package:home_haven/modules/profile/profile_screen.dart';

class CarousalModel {
  String? image;
  CarousalModel({this.image});
}

class HomeHavenCubit extends Cubit<HomeHavenStates> {
  HomeHavenCubit() : super(InitialState());

  static HomeHavenCubit get(context) => BlocProvider.of(context);

  List<Widget> screens = [
    HomeScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  List<String> titles = [
    'Home',
    'My Cart',
    'Profile',
  ];
  List<CarousalModel> images = [
    CarousalModel(image: 'assets/images/banner1.png'),
    CarousalModel(image: 'assets/images/banner2.png'),
  ];
  int currentIndex = 0;

  void changePage(int index) {
    currentIndex = index;
    emit(ChangePageState());
  }
}
