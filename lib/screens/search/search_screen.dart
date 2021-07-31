import 'package:flutter/material.dart';
import 'package:movie_app/screens/on_boarding/on_boarding_screen.dart';
import 'package:movie_app/screens/search/search_movie.dart';
import 'package:movie_app/screens/search/tv_search/search_tv.dart';
import 'package:movie_app/shared/cubit/app_cubit.dart';
import 'package:movie_app/shared/global/cache_helper.dart';
import 'package:movie_app/shared/global/end_points.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: kMainDarkColor,
        appBar: AppBar(
          title: const Text('Search'),
          actions: [
            IconButton(
              onPressed: () {
                CacheHelper.saveData(key: 'onBoarding', value: false)
                    .then((value) {
                  AppCubit.get(context).sessionSuccess = false;
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OnBoardingScreen()),
                  );
                });
              },
              icon: Icon(Icons.delete),
            ),
          ],
          bottom: TabBar(
            indicatorColor: Colors.green,
            unselectedLabelColor: Colors.black,
            tabs: [
              Tab(
                child: Column(
                  children: [Icon(Icons.movie_filter), Text('Movies')],
                ),
              ),
              Tab(
                child: Column(
                  children: [Icon(Icons.live_tv_outlined), Text('Tv Shows')],
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            SearchMovie(),
            SearchTvShows(),
          ],
        ),
      ),
    );
  }
}
