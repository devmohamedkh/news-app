import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/models/news_artical.dart';

class ApiServices {
  Future<List<NewsArtical>> fatchTopHeadLines() async {
    String url =
        'http://newsapi.org/v2/everything?q=bitcoin&from=2020-09-23&sortBy=publishedAt&apiKey=d03ba2d713db48c9a5fce46012355f1d';
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Iterable list = result['articles'];
      return list.map((e) => NewsArtical.fromJson(e)).toList();
    } else {
      throw Exception('cant load tha data');
    }
  }

  Future<List<NewsArtical>> searchFor() async {
    String url =
        'http://newsapi.org/v2/everything?q=bitcoin&from=2020-09-23&sortBy=publishedAt&apiKey=d03ba2d713db48c9a5fce46012355f1d';
    final response = await http.get(url);
    final result = jsonDecode(response.body);
    for (var i = 0; i < result.length; i++) {
      List lisrseach;
      lisrseach.add(result[i]);
      return lisrseach.map((e) => NewsArtical.fromJson(e)).toList();
    }
    return searchFor();
  }
}
