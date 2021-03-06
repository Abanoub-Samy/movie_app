import 'package:flutter/material.dart';
import 'package:movie_app/models/search_model.dart' hide SearchResults;
import 'package:movie_app/screens/movies/movie_details/details_screen.dart';
import 'package:movie_app/shared/cubit/app_cubit.dart';
import 'package:movie_app/shared/global/end_points.dart';
import 'package:movie_app/shared/global/responsive.dart';

class ResultsOfSearch extends StatelessWidget {
  final SearchModel? searchModel;

  ResultsOfSearch({required this.searchModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              ListView.separated(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailsScreen(
                                type: 'search-movie',
                                data: searchModel!.results![index],
                              )),
                    );
                  },
                  child: Container(
                    height: Responsive().height(40, context),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      elevation: 10,
                      child: Stack(fit: StackFit.expand, children: [
                        Image(
                          image: NetworkImage(kOriginalPosterBaseURL +
                              searchModel!.results![index].posterPath
                                  .toString()),
                          fit: BoxFit.fill,
                        ),
                        Align(
                          alignment: AlignmentDirectional.bottomCenter,
                          child: Container(
                            height: Responsive().height(9, context),
                            width: double.infinity,
                            color: Colors.black26.withOpacity(.8),
                            child: Padding(
                              padding: EdgeInsets.all(
                                  Responsive().height(1, context)),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Flexible(
                                    child: Text(
                                      searchModel!.results![index].title
                                          .toString(),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize:
                                            Responsive().height(3, context),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${searchModel!.results![index].voteAverage}',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize:
                                              Responsive().height(3, context),
                                        ),
                                      ),
                                      Text(
                                        '/10',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ),
                ),
                separatorBuilder: (context, index) => SizedBox(
                  height: 5,
                ),
                itemCount: AppCubit.get(context).searchModel!.results!.length,
              )
            ],
          ),
        ),
      ),
    );
  }
}
