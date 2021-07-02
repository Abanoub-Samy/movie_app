import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/screens/home_screen.dart';
import 'package:movie_app/screens/login_screen.dart';
import 'package:movie_app/shared/cubit/app_cubit.dart';
import 'package:movie_app/shared/cubit/app_states.dart';
import 'package:movie_app/shared/global/cache_helper.dart';
import 'package:movie_app/shared/global/end_points.dart';
import 'package:movie_app/shared/global/responsive.dart';

class AuthenticationScreen extends StatelessWidget {
  static String routeName = '/authentication-screen';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        if (state is GetGuestSessionSuccessState) {
          CacheHelper.saveData(key: 'onBoarding', value: true).then((value) {
            if (value) {
              Navigator.pushReplacementNamed(context, HomeScreen.routeName);
            }
          });
        } else if (state is GetGuestSessionErrorState) {
          print('You should approve first');
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: kMainDarkColor,
          body: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Responsive().height(16, context),
                vertical: Responsive().height(30, context),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {
                            AppCubit.get(context).launchURL();
                            Navigator.pushNamed(context, LoginScreen.routeName);
                          },
                          child: Text('Login'))),
                  Container(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {
                            AppCubit.get(context).getGuestSession();
                          },
                          child: Text('Guest'))),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
