// ignore: import_of_legacy_library_into_null_safe
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/shared/cubit/app_cubit.dart';
import 'package:movie_app/shared/cubit/app_states.dart';
import 'package:movie_app/shared/global/responsive.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = '/home-screen';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit.get(context).selectedCategory =
            AppCubit.get(context).categoryList[0];
        AppCubit.get(context).pageNumber = 1;
        var cubit = AppCubit.get(context);
        return SafeArea(
          child: Scaffold(
            body: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                cubit.screens[cubit.currentIndex],
                CurvedNavigationBar(
                  items: [
                    Icon(
                      Icons.movie_filter,
                      size: Responsive().height(4, context),
                      color: Colors.white,
                    ),
                    Icon(
                      Icons.live_tv,
                      size: Responsive().height(4, context),
                      color: Colors.white,
                    ),
                    Icon(
                      Icons.favorite,
                      size: Responsive().height(4, context),
                      color: Colors.white,
                    ),
                    Icon(
                      Icons.search,
                      size: Responsive().height(4, context),
                      color: Colors.white,
                    ),
                  ],
                  onTap: (index) {
                    cubit.changeBottom(index);
                  },
                  height: Responsive().height(7, context),
                  index: cubit.currentIndex,
                  color: Theme.of(context).primaryColor,
                  buttonBackgroundColor: Colors.green,
                  backgroundColor: Colors.transparent,
                  animationCurve: Curves.bounceInOut,
                  animationDuration: Duration(milliseconds: 200),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
