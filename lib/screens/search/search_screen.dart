import 'package:flutter/material.dart';
import 'package:movie_app/screens/search/search_movie.dart';
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
            Icon(Icons.directions_transit),
          ],
        ),
      ),
    );
  }
}
