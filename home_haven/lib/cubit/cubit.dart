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

  late List<Widget> screens = [
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

  void addToCart(ProductsModel model) {
    // Initialize the cart with the selected product
    initialize(model);
    cartItems.add(model);
    emit(AddToCartState());
  }

  void removeCart() {
    cartItems.clear();
    emit(ClearCartState());
  }

  int quantity = 1;
  late int price; // Initialize price without null
  late int totalPrice;

  void initialize(ProductsModel model) {
    price = model.price ?? price; // Set the price from the model
    totalPrice = price;
  }

  void plus() {
    quantity++;
    updateTotalPrice();
    emit(PlusItemsState());
  }

  void minus() {
    if (quantity > 1) {
      quantity--;
      updateTotalPrice();
      emit(MinusItemsState());
    }
  }

  int getTotalPrice() {
    int total = 0;
    for (var item in cartItems) {
      total += item.price! * quantity;
    }
    return total;
  }

  void updateTotalPrice() {
    totalPrice = getTotalPrice(); // Recalculate total price
    emit(TotalPriceUpdatedState(totalPrice));
    //return totalPrice;
  }
}
