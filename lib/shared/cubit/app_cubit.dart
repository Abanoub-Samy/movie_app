import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/models/search_model.dart';
import 'package:movie_app/models/search_tv.dart';
import 'package:movie_app/models/tv_model.dart';
import 'package:movie_app/screens/favorites/favorites_screen.dart';
import 'package:movie_app/screens/movies/movies_screen.dart';
import 'package:movie_app/screens/search/search_screen.dart';
import 'package:movie_app/screens/tv_shows/tv_shows_screen.dart';
import 'package:movie_app/shared/global/cache_helper.dart';
import 'package:movie_app/shared/cubit/app_states.dart';
import 'package:movie_app/shared/global/end_points.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitialState());

  static AppCubit get(context) => BlocProvider.of(context);
  bool isDark = false;
  int? pageNumber;
  String? url;
  int currentIndex = 0;
  List<Widget> screens = [
    MoviesScreen(),
    TvShowsScreen(),
    FavoritesScreen(),
    SearchScreen(),
  ];

  void changeBottom(int index) {
    currentIndex = index;
    emit(ChangeBottomNavState());
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

  List<String> categoryList = [
    'Popular',
    'Top Rated',
    'Upcoming',
    'New Playing',
  ];
  String? selectedCategory;
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
    emit(GetCategoryLoadingState());
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
      print(tvModel!.results!.length);
      emit(GetCategorySuccessState());
    }).catchError((onError) {
      emit(GetCategoryErrorState(onError.toString()));
    });
  }

  SearchModel? searchModel ;
  void searchMovies({required String search}) {
    emit(SearchMoviesLoadingState());
    Dio().get('https://api.themoviedb.org/3/search/movie?api_key=$kApiKey&query=$search&page=1'
    ).then((value) {
      searchModel = SearchModel.fromJson(value.data);
      emit(SearchMoviesSuccessState());
    }).catchError((onError) {
      emit(SearchMoviesErrorState(onError.toString()));
    });
  }

  var searchTvModel = null;
  void searchTvShows({required String search}) {
    emit(SearchTvLoadingState());
    Dio().get('https://api.themoviedb.org/3/search/tv?api_key=$kApiKey&page=1&query=$search'
    ).then((value) {
      searchTvModel = SearchTvModel.fromJson(value.data);
      emit(SearchTvSuccessState());
    }).catchError((onError) {
      emit(SearchTvErrorState(onError.toString()));
    });
  }

}
