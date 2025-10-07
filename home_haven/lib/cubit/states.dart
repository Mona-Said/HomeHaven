abstract class HomeHavenStates {}

class InitialState extends HomeHavenStates {}

class ChangePageState extends HomeHavenStates {}

class GetHomeDataLoadingState extends HomeHavenStates {}

class GetHomeDataSuccessState extends HomeHavenStates {}

class GetHomeDataErrorState extends HomeHavenStates {}

class AddToCartState extends HomeHavenStates {}

class ClearCartState extends HomeHavenStates {}

class PlusItemsState extends HomeHavenStates {}

class MinusItemsState extends HomeHavenStates {}

class TotalPriceUpdatedState extends HomeHavenStates {
  int totalPrice;
  TotalPriceUpdatedState(this.totalPrice);
}

class GetUserDataLoadingState extends HomeHavenStates {}

class GetUserDataSuccessState extends HomeHavenStates {}

class GetUserDataErrorState extends HomeHavenStates {}

class UpdateUserDataLoadingState extends HomeHavenStates {}

class UpdateUserDataSuccessState extends HomeHavenStates {}

class UpdateUserDataErrorState extends HomeHavenStates {}
