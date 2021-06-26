import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:movie_app/shared/cubit/app_cubit.dart';
import 'package:movie_app/shared/global/end_points.dart';
import 'package:movie_app/shared/global/responsive.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Completer<WebViewController> controller = Completer<WebViewController>() ;
    print(token);
    return Scaffold(
      backgroundColor: kMainDarkColor,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          child: Swiper(
            itemCount: 10,
            loop: true,
            duration: 1500,
            fade: .3,
            autoplay: true,
            viewportFraction: 0.82,
            scale: 0.9,
            layout: SwiperLayout.DEFAULT,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Expanded(
                    child: Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Stack(
                          fit: StackFit.passthrough,
                          children: [
                            Image.network(
                              kCroppedPosterBaseURL +
                                  AppCubit.get(context).movieModel!.results![index].posterPath
                                      .toString(),
                              fit: BoxFit.fill,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Responsive().height(2, context),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Text(
                          AppCubit.get(context).movieModel!.results![index].title.toString(),
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: Responsive().height(4, context),
                            fontFamily: 'Teko_Bold',
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Responsive().height(1, context),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: Responsive().height(5, context),
                          ),
                          SizedBox(
                            height: Responsive().height(1, context),
                          ),
                          Row(
                            children: [
                              Text(
                                '${AppCubit.get(context).movieModel!.results![index].voteAverage}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: Responsive().width(5, context),
                                ),
                              ),
                              Text(
                                '/10',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: Responsive().width(4, context),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Icon(
                            Icons.portrait_outlined,
                            color: Colors.green,
                            size: Responsive().height(5, context),
                          ),
                          SizedBox(
                            height: Responsive().height(1, context),
                          ),
                          Text(
                            '${AppCubit.get(context).movieModel!.results![index].popularity}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: Responsive().width(5, context),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Responsive().height(10, context),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
