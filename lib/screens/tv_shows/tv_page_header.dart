import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/shared/cubit/app_cubit.dart';
import 'package:movie_app/shared/cubit/app_states.dart';
import 'package:movie_app/shared/global/end_points.dart';

class TvPageHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Tv Shows / ',
                      style: TextStyle(
                          color: kMainLightColor,
                          fontSize: 35.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Teko_Bold',
                          letterSpacing: 1.2),
                    ),
                    TextSpan(
                      text: cubit.selectedCategory,
                      style: TextStyle(
                          color: kMainLightColor.withOpacity(0.7),
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Teko_Medium',
                          letterSpacing: 1.2),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.more_vert,
                color: kMainLightColor,
                size: 25.0,
              ),
            ],
          ),
        );
      },
    );
  }
}
