import 'package:flutter/material.dart';

const kMainDarkColor = Color(0xff2d2d2d);
const kSecondDarkColor = Color(0xff424242);
const kSecondLightColor = Color(0xff838383);
const kMainLightColor = Color(0xffffffff);
const kGoldInkColor = Color(0xffffc491);
const kAccentColor = Color(0xfffe8785);

const kApiKey = 'd4976a37fb39726f29ed4420cbee1e56';

const kMovieGenre =
    'https://api.themoviedb.org/3/genre/movie/list?api_key=$kApiKey&language=en-US';
const kPopularMovies =
    'https://api.themoviedb.org/3/movie/popular?api_key=$kApiKey&language=en-US';
const kTopRatedMovies =
    'https://api.themoviedb.org/3/movie/top_rated?api_key=$kApiKey&language=en-US';
const kUpcomingMovies =
    'https://api.themoviedb.org/3/movie/upcoming?api_key=$kApiKey&language=en-US&page=1';
const kLastMovies =
    'https://api.themoviedb.org/3/movie/latest?api_key=$kApiKey&language=en-US';
const kNewPlayingMovies =
    'https://api.themoviedb.org/3/movie/now_playing?api_key=$kApiKey&language=en-US&page=1';
const kTrendingMovies =
    'https://api.themoviedb.org/3/trending/movie/day?api_key=$kApiKey';
const kTrendingTv =
    'https://api.themoviedb.org/3/trending/t v/day?api_key=$kApiKey';

const kCroppedPosterBaseURL = 'https://image.tmdb.org/t/p/w200/';

const kOriginalPosterBaseURL = 'https://image.tmdb.org/t/p/original/';
