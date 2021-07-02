abstract class AppStates {}

class InitialState extends AppStates {}

class AppChangeMode extends AppStates {}

class ChangeBottomNavState extends AppStates {}
class ChangePageNumberState extends AppStates {}
class ChangeCategoryState extends AppStates{}

class GetCategoryLoadingState extends AppStates {}

class GetCategorySuccessState extends AppStates {}

class GetCategoryErrorState extends AppStates {
  final String error;

  GetCategoryErrorState(this.error);
}

class GetTvCategoryLoadingState extends AppStates {}

class GetTvCategorySuccessState extends AppStates {}

class GetTvCategoryErrorState extends AppStates {
  final String error;

  GetTvCategoryErrorState(this.error);
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

class GetTokenLoadingState extends AppStates {}

class GetTokenSuccessState extends AppStates {}

class GetTokenErrorState extends AppStates {
  final String error;

  GetTokenErrorState(this.error);
}
class GetSessionLoadingState extends AppStates {}

class GetSessionSuccessState extends AppStates {}

class GetSessionErrorState extends AppStates {
  final String error;

  GetSessionErrorState(this.error);
}

class GetGuestSessionLoadingState extends AppStates {}

class GetGuestSessionSuccessState extends AppStates {}

class GetGuestSessionErrorState extends AppStates {
  final String error;

  GetGuestSessionErrorState(this.error);
}

class GetSessionWithLoginLoadingState extends AppStates {}

class GetSessionWithLoginSuccessState extends AppStates {}

class GetSessionWithLoginErrorState extends AppStates {
  final String error;

  GetSessionWithLoginErrorState(this.error);
}