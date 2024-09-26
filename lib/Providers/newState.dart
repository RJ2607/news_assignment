import 'package:flutter/material.dart';
import 'package:news_assignment/models/topHeadLinesModel.dart';

class NewState extends ChangeNotifier {
  Articles _articles = Articles();

  Articles get articles => _articles;

  void setArticles(Articles newArticles) {
    _articles = newArticles;
    notifyListeners();
  }

  void launchUrl(String url) {
    print(url);
  }
}
