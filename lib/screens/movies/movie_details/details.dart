import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/shared/cubit/app_cubit.dart';
import 'package:movie_app/shared/cubit/app_states.dart';
import 'package:movie_app/shared/global/end_points.dart';
import 'package:movie_app/shared/global/responsive.dart';

class Details extends StatefulWidget {
  final dynamic model;
  final bool? isMovie;

  Details({required this.model, required this.isMovie});

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  bool isFavorite = false;
  int? index;

  @override
  void initState() {
    AppCubit.get(context).getFavorite();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
          condition: state is GetFavoriteSuccessState,
          fallback: (context) => CircularProgressIndicator(),
          builder: (context) {
            for (int i = 0;
                i < AppCubit.get(context).getFavoriteModel!.results!.length;
                i++) {
              if (widget.model.id ==
                  AppCubit.get(context).getFavoriteModel!.results![i].id) {
                index = i;
                isFavorite = true;
                break;
              } else {
                index = -1;
              }
            }
            return Padding(
              padding: EdgeInsets.all(Responsive().height(1, context)),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          '${widget.model.title}',
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: Responsive().height(5, context),
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: IconButton(
                          icon: Icon(
                            isFavorite
                                ? Icons.favorite
                                : Icons.favorite_outline,
                            size: Responsive().height(6, context),
                            color: isFavorite ? Colors.red : Colors.green,
                          ),
                          onPressed: () {
                            if (isFavorite) {
                              AppCubit.get(context)
                                  .getFavoriteModel!
                                  .results!
                                  .removeAt(index!);
                              setState(() {
                                isFavorite = !isFavorite;
                              });
                              AppCubit.get(context).setFavorite(
                                  mediaType: 'movie',
                                  mediaId: widget.model.id,
                                  favorite: false);
                              print('removed');
                            } else {
                              setState(() {
                                isFavorite = !isFavorite;
                                AppCubit.get(context).setFavorite(
                                    mediaType: 'movie',
                                    mediaId: widget.model.id,
                                    favorite: true);
                              });
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  if (widget.isMovie == true)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Publish Date : ${widget.model.releaseDate}',
                          style: TextStyle(
                            fontSize: Responsive().height(3, context),
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  if (widget.isMovie == false)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Publish Date : ${widget.model.firstAirDate}',
                          style: TextStyle(
                            fontSize: Responsive().height(3, context),
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  SizedBox(
                    height: Responsive().height(1, context),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Language : ${widget.model.originalLanguage}',
                        style: TextStyle(
                          fontSize: Responsive().height(3, context),
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Responsive().height(2, context),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Plot Summary',
                        style: TextStyle(
                          fontSize: Responsive().height(3, context),
                          color: kMainLightColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Responsive().height(1, context),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          '${widget.model.overview}',
                          maxLines: 8,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: Responsive().height(2, context),
                            color: Colors.grey,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Responsive().height(3, context),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Cast & Crew',
                        style: TextStyle(
                          fontSize: Responsive().height(3, context),
                          color: kMainLightColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
