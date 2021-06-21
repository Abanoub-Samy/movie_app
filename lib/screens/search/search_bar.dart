import 'package:flutter/material.dart';
import 'package:movie_app/shared/cubit/app_cubit.dart';
import 'package:movie_app/shared/global/responsive.dart';

class SearchBar extends StatelessWidget {
  final bool isMovie;

  const SearchBar({required this.isMovie}) ;
  @override
  Widget build(BuildContext context) {
    var text = TextEditingController();
    return Container(
      height: Responsive().height(7, context),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    hintText: 'type your text here',
                    border: InputBorder.none),
                controller: text,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: Responsive().height(3, context),
                ),
              ),
            ),
            flex: 4,
          ),
          Expanded(
            child: Container(
              height: Responsive().height(9, context),
              color: Colors.green,
              child: MaterialButton(
                  onPressed: () {
                    if(text.text.isNotEmpty){
                      if(isMovie){
                        AppCubit.get(context).searchMovies(search: text.text);
                      }else{
                        AppCubit.get(context).searchTvShows(search: text.text);
                      }
                    }
                  },
                  child: Icon(
                    Icons.search,
                    size: Responsive().width(6, context),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
