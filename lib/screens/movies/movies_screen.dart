// ignore: import_of_legacy_library_into_null_safe
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/shared/global/responsive.dart';
import 'package:movie_app/widgets/category_selector.dart';
import 'package:movie_app/screens/movies/movie_grid.dart';
import 'package:movie_app/screens/movies/page_header.dart';
import 'package:movie_app/shared/cubit/app_cubit.dart';
import 'package:movie_app/shared/cubit/app_states.dart';
import 'package:movie_app/widgets/custom_swiper.dart';

class MoviesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppCubit.get(context).getMoviesByCategory();
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var model = AppCubit.get(context).movieModel;
        return Scaffold(
          body: Container(
            height: double.infinity,
            color: Colors.black87,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  buildHeaderSliverList(context, model),
                  ConditionalBuilder(
                    condition: model!=null,
                    fallback: (context) => Center(
                      child: LinearProgressIndicator(
                        color: Colors.green,
                        minHeight: 5,
                      ),
                    ),
                    builder: (context) => MoviesGrid(
                      model: model,
                    ),
                  ),
                  SizedBox(
                    height: Responsive().height(1, context),
                  ),
                  Container(
                    width: double.infinity,
                    height: Responsive().height(4, context),
                    child: TextButton(
                        onPressed: () {
                          AppCubit.get(context)
                              .changePageNumberMovie(model!.page! + 1);
                        },
                        child: Text(
                          'Load More...',
                          style: TextStyle(
                            color: Colors.green,
                          ),
                        )),
                  ),
                  SizedBox(
                    height: Responsive().height(8, context),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildHeaderSliverList(context, MovieModel? model) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          PageHeader(),
          CustomSwiper(
            movieModel: model,
          ),
          SizedBox(
            height: Responsive().height(1, context),
          ),
          CategorySelector(
            categoryList: AppCubit.get(context).categoryList,
            onClick: (selectedCategory) {
              AppCubit.get(context).changeCategory(selectedCategory);
              AppCubit.get(context).getMoviesByCategory();
            },
          ),
        ],
      ),
    );
  }
}
