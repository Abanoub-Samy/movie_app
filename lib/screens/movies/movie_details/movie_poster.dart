import 'package:flutter/material.dart';
import 'package:movie_app/shared/cubit/app_cubit.dart';
import 'package:movie_app/shared/global/end_points.dart';
import 'package:movie_app/shared/global/responsive.dart';
import 'package:number_inc_dec/number_inc_dec.dart';

class MoviePoster extends StatefulWidget {
  final dynamic model;

  MoviePoster({required this.model});

  @override
  _MoviePosterState createState() => _MoviePosterState();
}

class _MoviePosterState extends State<MoviePoster> {
  var controller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        Container(
          width: double.infinity,
          height: Responsive().height(50, context),
          child: ClipRRect(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40)),
            child: Image(
              image: NetworkImage(
                kOriginalPosterBaseURL + widget.model.posterPath.toString(),
              ),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: Responsive().width(20, context)),
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Responsive().height(5, context)),
                bottomLeft: Radius.circular(Responsive().height(5, context)),
              ),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: Responsive().width(4, context),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.yellowAccent,
                      size: Responsive().height(3.5, context),
                    ),
                    SizedBox(
                      height: Responsive().height(.5, context),
                    ),
                    Row(
                      children: [
                        Text(
                          '${widget.model.voteAverage}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: Responsive().width(3, context),
                          ),
                        ),
                        Text(
                          '/10',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: Responsive().width(2.5, context),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      child: Icon(
                        Icons.star_border,
                        size: Responsive().height(4, context),
                      ),
                      onTap: () {
                        _showMyDialog(context);
                      },
                    ),
                    SizedBox(
                      height: Responsive().height(.5, context),
                    ),
                    Text(
                      'Rate This',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: Responsive().width(3, context),
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      Icons.portrait_outlined,
                      color: Colors.black,
                      size: Responsive().height(4, context),
                    ),
                    SizedBox(
                      height: Responsive().height(.5, context),
                    ),
                    Text(
                      '${widget.model.popularity}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: Responsive().width(3, context),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );

  }

  void _showMyDialog(context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Rate Movie'),
          content: Container(
            child: NumberInputPrefabbed.directionalButtons(
              controller: controller,
              isInt: false,
              incDecFactor: 0.5,
              min: 0,
              max: 10,
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: (){
                double value = double.parse(controller.text);
                AppCubit.get(context).setRate(value: value, mediaId: widget.model.id);
                Navigator.pop(context, 'OK');
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
