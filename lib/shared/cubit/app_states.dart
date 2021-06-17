abstract class AppStates {}

class InitialState extends AppStates {}

class AppChangeMode extends AppStates {}

class ChangeBottomNavState extends AppStates {}

class GetCategoryLoadingState extends AppStates {}

class GetCategorySuccessState extends AppStates {}

class GetCategoryErrorState extends AppStates {
  final String error;

  GetCategoryErrorState(this.error);
}
