import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/shared/cubit/app_cubit.dart';
import 'package:movie_app/shared/cubit/app_states.dart';
import 'package:movie_app/shared/global/end_points.dart';
import 'package:movie_app/shared/global/responsive.dart';

class CustomSwiper extends StatelessWidget {
  final MovieModel? movieModel;

  const CustomSwiper({required this.movieModel});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
          condition: movieModel != null,
          builder: (context) => Column(
            children: [
              Container(
                width: double.infinity,
                height: Responsive().height(30, context),
                child: Swiper(
                  itemCount: movieModel!.results!.length,
                  loop: true,
                  duration: 1500,
                  fade: 0.1,
                  autoplay: true,
                  itemWidth: 30,
                  itemHeight: 30,
                  viewportFraction: 0.75,
                  scale: 0.9,
                  onIndexChanged: (index) {},
                  layout: SwiperLayout.DEFAULT,
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(7.0),
                      child: Stack(
                        fit: StackFit.passthrough,
                        children: [
                          Image.network(
                            kCroppedPosterBaseURL +
                                movieModel!.results![index].posterPath
                                    .toString(),
                            fit: BoxFit.fill,
                          ),
                          Positioned(
                            bottom: 10,
                            left: 15,
                            width: 200,
                            child: Text(
                              movieModel!.results![index].title.toString(),
                              overflow: TextOverflow.fade,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22.0,
                                fontFamily: 'Teko_Bold',
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
