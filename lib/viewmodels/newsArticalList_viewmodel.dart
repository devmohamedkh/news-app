import 'package:flutter/cupertino.dart';
import 'package:news/models/news_artical.dart';
import 'package:news/services/api_services.dart';
import 'package:news/viewmodels/newsArtical_viewmodel.dart';

class NewsAticalListViewModel extends ChangeNotifier {
  List<NewsArticalViewModel> artical = List<NewsArticalViewModel>();
  Future<void> populetTopHeadLines() async {
    List<NewsArtical> newsArtical = await ApiServices().fatchTopHeadLines();
    this.artical =
        newsArtical.map((e) => NewsArticalViewModel(article: e)).toList();
    notifyListeners();
  }
}
