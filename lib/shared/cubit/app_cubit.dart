import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:movie_app/models/account_model.dart';
import 'package:movie_app/models/get_favorite_model.dart';
import 'package:movie_app/models/guest_session_model.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/models/search_model.dart';
import 'package:movie_app/models/search_tv.dart';
import 'package:movie_app/models/session_model.dart';
import 'package:movie_app/models/session_with_login_model.dart';
import 'package:movie_app/models/set_favorite_model.dart';
import 'package:movie_app/models/token_model.dart';
import 'package:movie_app/models/tv_model.dart';
import 'package:movie_app/screens/favorites/favorites_screen.dart';
import 'package:movie_app/screens/movies/movies_screen.dart';
import 'package:movie_app/screens/search/search_screen.dart';
import 'package:movie_app/screens/tv_shows/tv_shows_screen.dart';
import 'package:movie_app/shared/global/cache_helper.dart';
import 'package:movie_app/shared/cubit/app_states.dart';
import 'package:movie_app/shared/global/end_points.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:url_launcher/url_launcher.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitialState());

  static AppCubit get(context) => BlocProvider.of(context);
  bool isDark = false;
  int? pageNumber;
  String? url;
  int currentIndex = 0;
  String? selectedCategory = 'popular';

  List<Widget> screens = [
    MoviesScreen(),
    TvShowsScreen(),
    FavoritesScreen(),
    SearchScreen(),
  ];
  List<String> categoryList = [
    'Popular',
    'Top Rated',
    'Upcoming',
    'New Playing',
  ];

  void changeBottom(int index) {
    currentIndex = index;
    selectedCategory = categoryList[0];
    pageNumber = 1;
    emit(ChangeBottomNavState());
  }

  void changePageNumberMovie(int index) {
    if (index <= movieModel!.totalPages!.toInt()) {
      pageNumber = index;
      getMoviesByCategory();
    } else {
      Fluttertoast.showToast(
          msg: "This is the last page!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  void changePageNumberTv(int index) {
    if (index <= movieModel!.totalPages!.toInt()) {
      pageNumber = index;
      getTvShowsByCategory();
    } else {
      Fluttertoast.showToast(
          msg: "This is the last page!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  void changeAppMode({bool? fromShared}) {
    if (fromShared != null)
      isDark = fromShared;
    else
      isDark = !isDark;
    CacheHelper.saveData(key: 'isDark', value: isDark).then((value) {
      emit(AppChangeMode());
    });
  }

  void changeCategory(String category) {
    selectedCategory = category;
    emit(ChangeCategoryState());
  }

  MovieModel? movieModel;

  void getMoviesByCategory() {
    emit(GetCategoryLoadingState());
    switch (selectedCategory) {
      case 'Top Rated':
        url =
            'https://api.themoviedb.org/3/movie/top_rated?api_key=$kApiKey&language=en-US&page=$pageNumber';
        break;
      case 'Upcoming':
        url =
            'https://api.themoviedb.org/3/movie/upcoming?api_key=$kApiKey&language=en-US&page=$pageNumber';
        break;
      case 'New Playing':
        url =
            'https://api.themoviedb.org/3/movie/now_playing?api_key=$kApiKey&language=en-US&page=$pageNumber';
        break;
      default:
        url =
            'https://api.themoviedb.org/3/movie/popular?api_key=$kApiKey&language=en-US&page=$pageNumber';
    }
    Dio().get(url!).then((value) {
      movieModel = MovieModel.fromJson(value.data);
      print(movieModel!.results!.length);
      emit(GetCategorySuccessState());
    }).catchError((onError) {
      emit(GetCategoryErrorState(onError.toString()));
    });
  }

  TvModel? tvModel;

  void getTvShowsByCategory() {
    emit(GetTvCategoryLoadingState());
    switch (selectedCategory) {
      case 'Top Rated':
        url =
            'https://api.themoviedb.org/3/tv/top_rated?api_key=$kApiKey&language=en-US&page=$pageNumber';
        break;
      case 'Upcoming':
        url =
            'https://api.themoviedb.org/3/tv/airing_today?api_key=$kApiKey&language=en-US&page=$pageNumber';
        break;
      case 'New Playing':
        url =
            'https://api.themoviedb.org/3/tv/on_the_air?api_key=$kApiKey&language=en-US&page=$pageNumber';
        break;
      default:
        url =
            'https://api.themoviedb.org/3/tv/popular?api_key=$kApiKey&language=en-US&page=$pageNumber';
    }
    Dio().get(url!).then((value) {
      tvModel = TvModel.fromJson(value.data);
      print(url);
      emit(GetTvCategorySuccessState());
    }).catchError((onError) {
      emit(GetTvCategoryErrorState(onError.toString()));
      print(onError.toString());
    });
  }

  SearchModel? searchModel;

  void searchMovies({required String search}) {
    emit(SearchMoviesLoadingState());
    Dio()
        .get(
            'https://api.themoviedb.org/3/search/movie?api_key=$kApiKey&query=$search&page=1')
        .then((value) {
      searchModel = SearchModel.fromJson(value.data);
      emit(SearchMoviesSuccessState());
    }).catchError((onError) {
      emit(SearchMoviesErrorState(onError.toString()));
    });
  }

  var searchTvModel;

  void searchTvShows({required String search}) {
    emit(SearchTvLoadingState());
    Dio()
        .get(
            'https://api.themoviedb.org/3/search/tv?api_key=$kApiKey&page=1&query=$search')
        .then((value) {
      searchTvModel = SearchTvModel.fromJson(value.data);
      emit(SearchTvSuccessState());
    }).catchError((onError) {
      emit(SearchTvErrorState(onError.toString()));
    });
  }

  TokenModel? tokenModel;

  void getToken() {
    emit(GetTokenLoadingState());
    Dio()
        .get(
            'https://api.themoviedb.org/3/authentication/token/new?api_key=$kApiKey')
        .then((value) {
      tokenModel = TokenModel.fromJson(value.data);
      token = tokenModel!.requestToken.toString();
      emit(GetTokenSuccessState());
      print(token);
      //_launchURL();
    }).catchError((onError) {
      emit(GetTokenErrorState(onError.toString()));
    });
  }

  SessionModel? sessionModel;
  bool sessionSuccess = false;

  void getSession() {
    emit(GetSessionLoadingState());
    Dio().get(
      'https://api.themoviedb.org/3/authentication/session/new?api_key=$kApiKey',
      queryParameters: {'request_token': token},
    ).then((value) {
      sessionModel = SessionModel.fromJson(value.data);
      if (sessionModel!.success == true) {
        sessionSuccess = true;
        session = sessionModel!.sessionId!;
      }
      emit(GetSessionSuccessState());
      getAccountData();
    }).catchError((onError) {
      emit(GetSessionErrorState(onError.toString()));
    });
  }

  launchURL() async {
    String url = 'https://www.themoviedb.org/authenticate/$token';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  GuestSessionModel? guestSessionModel;
  bool guestSessionSuccess = false;

  void getGuestSession() {
    emit(GetGuestSessionLoadingState());
    Dio()
        .get(
      'https://api.themoviedb.org/3/authentication/guest_session/new?api_key=$kApiKey',
    )
        .then((value) {
      guestSessionModel = GuestSessionModel.fromJson(value.data);
      if (guestSessionModel!.success == true) {
        guestSessionSuccess = true;
        session = guestSessionModel!.guestSessionId!;
      }
      emit(GetGuestSessionSuccessState());
      print(guestSessionModel!.guestSessionId);
      print(guestSessionModel!.expiresAt);
    }).catchError((onError) {
      emit(GetGuestSessionErrorState(onError.toString()));
      print(onError.toString());
    });
  }

  SessionWithLoginModel? sessionWithLoginModel;
  void getSessionWithLogin(
      {required String userName, required String password}) {
    emit(GetSessionWithLoginLoadingState());
    Dio().get(
      'https://api.themoviedb.org/3/authentication/token/validate_with_login?api_key=$kApiKey',
      queryParameters: {
        'request_token': token,
        'username': userName,
        'password': password,
      },
    ).then((value) {
      sessionWithLoginModel = SessionWithLoginModel.fromJson(value.data);
      if (sessionWithLoginModel!.success == true) {
        sessionSuccess = true;
        session = sessionWithLoginModel!.requestToken!;
      }
      emit(GetSessionWithLoginSuccessState());
      getSession();
    }).catchError((onError) {
      emit(GetSessionWithLoginErrorState(onError.toString()));
    });
  }

  AccountModel? accountModel;
  void getAccountData() {
    emit(GetAccountLoadingState());
    Dio()
        .get(
      'https://api.themoviedb.org/3/account?api_key=$kApiKey&session_id=$session',
    )
        .then((value) {
      accountModel = AccountModel.fromJson(value.data);
      accountId = accountModel!.id;
      emit(GetAccountSuccessState());
      getFavorite();
    }).catchError((onError) {
      print(onError.toString());
      emit(GetAccountErrorState(onError));
    });
  }

  SetFavoriteModel? setFavoriteModel;

  void setFavorite(
      {required String mediaType,
      required int? mediaId,
      required bool favorite}) {
    emit(SetFavoriteLoadingState());
    Dio().post(
      'https://api.themoviedb.org/3/account/$accountId/favorite?api_key=$kApiKey&session_id=$session',
      queryParameters: {
        'media_type': mediaType,
        'media_id': mediaId,
        'favorite': favorite,
      },
    ).then((value) {
      setFavoriteModel = SetFavoriteModel.fromJson(value.data);
      print(setFavoriteModel!.statusMessage);
      getFavorite();
      emit(SetFavoriteSuccessState());
    }).catchError((onError) {
      emit(SetFavoriteErrorState(onError));
      print(onError.toString());
    });
  }

  GetFavoriteModel? getFavoriteModel;

  void getFavorite() {
    print(kApiKey);
    print(session);
    print(accountId);
    emit(GetFavoriteLoadingState());
    Dio()
        .get(
      'https://api.themoviedb.org/3/account/$accountId/favorite/movies?api_key=$kApiKey&session_id=$session&language=en-US&sort_by=created_at.asc&page=1',
    )
        .then((value) {
      getFavoriteModel = GetFavoriteModel.fromJson(value.data);
      print(getFavoriteModel!.totalResults);
      emit(GetFavoriteSuccessState());
    }).catchError((onError) {
      emit(GetFavoriteErrorState(onError));
      print(onError.toString());
    });
  }
}
