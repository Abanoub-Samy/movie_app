import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/screens/movie_details/details.dart';
import 'package:movie_app/screens/movie_details/movie_poster.dart';
import 'package:movie_app/shared/global/end_points.dart';
import 'package:movie_app/shared/global/responsive.dart';

class DetailsScreen extends StatelessWidget {
  static String routeName = '/details-screen';

  @override
  Widget build(BuildContext context) {
    final model = ModalRoute.of(context)!.settings.arguments as Results;
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: const Text('Movie Details'),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              MoviePoster(
                model: model,
              ),
              SizedBox(
                height: Responsive().height(2, context),
              ),
              Details(model: model),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: Responsive().height(25, context),
                  child: ListView.separated(
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Column(
                      children: <Widget>[
                        CircleAvatar(
                          radius: Responsive().height(9, context),
                          backgroundImage: AssetImage(
                            'assets/images/placeperson.png',
                          ),
                        ),
                        Text(
                          'abanoub',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: Responsive().height(3, context),
                          ),
                        ),
                        Text(
                          'Spider Man',
                          style: TextStyle(
                            color: kSecondLightColor,
                            fontSize: Responsive().height(2, context),
                          ),
                        )
                      ],
                    ),
                    separatorBuilder: (context, index) => SizedBox(
                      width: Responsive().width(2, context),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: Responsive().height(2, context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
