import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/screens/favorites/favorites_screen.dart';
import 'package:movie_app/screens/movies/movies_screen.dart';
import 'package:movie_app/screens/search/search_screen.dart';
import 'package:movie_app/screens/tv_shows/tv_shows_screen.dart';
import 'package:movie_app/shared/global/cache_helper.dart';
import 'package:movie_app/shared/cubit/app_states.dart';


class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitialState());

  static AppCubit get(context) => BlocProvider.of(context);
  bool isDark = false;

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

  // HomeModel? homeModel;
  // Map<int?, bool> favorites = {};
  //
  // void getHomeData() {
  //   emit(HomeLoadingState());
  //   DioHelper.getDate(
  //     url: Home,
  //     token: Token,
  //   ).then((value) {
  //     homeModel = HomeModel.fromJson(value.data);
  //     //print(homeModel!.status.toString());
  //     homeModel!.data!.products!.forEach((element) {
  //       favorites.addAll({element.id: element.inFavorites});
  //       //print(favorites);
  //     });
  //     print('good');
  //     emit(HomeSuccessState());
  //   }).catchError((onError) {
  //     emit(HomeErrorState(onError.toString()));
  //     print(onError.toString());
  //   });
  // }
  //
  // CategoriesModel? categoriesModel;
  //
  // void getCategoriesData() {
  //   emit(CategoriesLoadingState());
  //   DioHelper.getDate(
  //     url: Categories,
  //     token: Token,
  //   ).then((value) {
  //     categoriesModel = CategoriesModel.fromJson(value.data);
  //     //print(categoriesModel!.status.toString());
  //     emit(CategoriesSuccessState());
  //   }).catchError((onError) {
  //     emit(CategoriesErrorState(onError.toString()));
  //     print(onError.toString());
  //   });
  // }
  //
  // ChangeFavoritesModel? changeFavoritesModel;
  //
  // void changeFavorites(int? productId) {
  //   if (favorites[productId] == true) {
  //     favorites[productId] = false;
  //     //getFavoritesData();
  //   } else {
  //     favorites[productId] = true;
  //     getFavoritesData();
  //   }
  //   emit(FavoritesChange());
  //   DioHelper.postDate(
  //       url: Favorites,
  //       data: {
  //         'product_id': productId,
  //       },
  //       token: Token)
  //       .then((value) {
  //     changeFavoritesModel = ChangeFavoritesModel.fromJson(value.data);
  //     emit(FavoritesSuccessState(changeFavoritesModel!));
  //     if (changeFavoritesModel!.status == false) {
  //       if (favorites[productId] == true) {
  //         favorites[productId] = false;
  //       } else {
  //         favorites[productId] = true;
  //       }
  //     }
  //     emit(FavoritesChangeState());
  //   }).catchError((onError) {
  //     if (favorites[productId] == true) {
  //       favorites[productId] = false;
  //     } else {
  //       favorites[productId] = true;
  //     }
  //     emit(FavoritesErrorState(onError.toString()));
  //     print(onError.toString());
  //   });
  // }
  //
  // FavoritesModel? favoritesModel;
  //
  // void getFavoritesData() {
  //   emit(GetFavoritesLoadingState());
  //   DioHelper.getDate(
  //     url: Favorites,
  //     token: Token,
  //   ).then((value) {
  //     favoritesModel = FavoritesModel.fromJson(value.data);
  //     emit(GetFavoritesSuccessState());
  //   }).catchError((onError) {
  //     emit(GetFavoritesErrorState(onError.toString()));
  //     print(onError.toString());
  //   });
  // }
  //
  //
  // SearchModel? searchModel;
  //
  // void searchProduct({
  //   required String text,
  // }) {
  //   emit(SearchLoadingState());
  //   DioHelper.postDate(
  //     url: Search,
  //     token: Token,
  //     data: {
  //       'text': text,
  //     },
  //   ).then((value) {
  //     searchModel = SearchModel.fromJson(value.data);
  //     emit(SearchSuccessState());
  //   }).catchError((onError) {
  //     emit(SearchErrorState(onError.toString()));
  //     print(onError.toString());
  //   });
  // }
}