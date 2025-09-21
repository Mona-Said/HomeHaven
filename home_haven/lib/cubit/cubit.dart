import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_haven/cubit/states.dart';
import 'package:home_haven/modules/cart/cart_screen.dart';
import 'package:home_haven/modules/home/home_screen.dart';
import 'package:home_haven/modules/profile/profile_screen.dart';
import 'package:home_haven/shared/network/remote/dio_helper.dart';
import 'package:home_haven/shared/network/remote/end_points.dart';

import '../models/products_model.dart';

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
  final List<String> images = [
    'assets/images/banner1.png',
    'assets/images/banner2.png',
  ];
  int currentIndex = 0;

  void changePage(int index) {
    currentIndex = index;
    emit(ChangePageState());
  }

  HomeModel? homeModel;

  void getHomeData() {
    emit(GetHomeDataLoadingState());

    DioHelper.getData(url: PRODUCTS).then((value) {
      homeModel = HomeModel.fromJson(value.data);
      emit(GetHomeDataSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetHomeDataErrorState());
    });
  }

  List<ProductsModel> cartItems = [];

  void removeCart() {
    cartItems.clear();
    emit(ClearCartState());
  }
}
