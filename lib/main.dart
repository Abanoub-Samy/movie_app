import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/screens/home_screen.dart';
import 'package:movie_app/screens/login_screen.dart';
import 'package:movie_app/screens/on_boarding/on_boarding_screen.dart';
import 'package:movie_app/shared/cubit/app_cubit.dart';
import 'package:movie_app/shared/cubit/app_states.dart';
import 'package:movie_app/shared/cubit/bloc_observer.dart';
import 'package:movie_app/shared/global/cache_helper.dart';
import 'package:movie_app/shared/global/dio_helper.dart';
import 'package:movie_app/shared/styles/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  bool isDark = CacheHelper.getData(key: 'isDark');
  bool onBoarding = CacheHelper.getData(key: 'onBoarding');
  Widget? widget;
  if (onBoarding != null) {
    widget = HomeScreen();
  } else {
    widget = OnBoardingScreen();
  }
  runApp(MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext ctx) =>
              AppCubit()..changeAppMode(fromShared: isDark)..getMoviesByCategory(),
        ),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (ctx, state) {},
        builder: (ctx, state) {
          return MyApp(isDark, widget);
        },
      )));
}

class MyApp extends StatelessWidget {
  final bool isDark;
  final Widget? widget;

  MyApp(this.isDark, this.widget);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode:
          AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
      routes: {
        HomeScreen.routeName: (ctx) => HomeScreen(),
        LoginScreen.routeName: (ctx) => LoginScreen(),
      },
      home: widget,
    );
  }
}
