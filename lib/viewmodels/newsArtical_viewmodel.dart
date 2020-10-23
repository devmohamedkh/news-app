import 'package:news/models/news_artical.dart';

class NewsArticalViewModel {
  NewsArtical _newsArticle;

  NewsArticalViewModel({NewsArtical article}) : _newsArticle = article;

  String get title {
    return _newsArticle.title;
  }

  String get description {
    return _newsArticle.description;
  }

  String get imageUrl {
    return _newsArticle.urlToImage;
  }

  String get url {
    return _newsArticle.url;
  }
}
