abstract class AppStates {}

class InitialState extends AppStates {}

class AppChangeMode extends AppStates {}

class ChangeBottomNavState extends AppStates {}
class ChangeCategoryState extends AppStates{}
class GetCategoryLoadingState extends AppStates {}

class GetCategorySuccessState extends AppStates {}

class GetCategoryErrorState extends AppStates {
  final String error;

  GetCategoryErrorState(this.error);
}

class SearchMoviesLoadingState extends AppStates {}

class SearchMoviesSuccessState extends AppStates {}

class SearchMoviesErrorState extends AppStates {
  final String error;

  SearchMoviesErrorState(this.error);
}

class SearchTvLoadingState extends AppStates {}

class SearchTvSuccessState extends AppStates {}

class SearchTvErrorState extends AppStates {
  final String error;

  SearchTvErrorState(this.error);
}