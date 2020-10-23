import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:news/models/news_artical.dart';
import 'package:news/viewmodels/newsArticalList_viewmodel.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List lisrseach;

  Future<List<NewsArtical>> searchFor() async {
    String url =
        'http://newsapi.org/v2/everything?q=bitcoin&from=2020-09-23&sortBy=publishedAt&apiKey=d03ba2d713db48c9a5fce46012355f1d';
    final response = await get(url);
    final result = jsonDecode(response.body);
    for (var i = 0; i < result.length; i++) {
      lisrseach.add(result[i]['title']);
      return lisrseach.map((e) => NewsArtical.fromJson(e)).toList();
    }
    return searchFor();
  }

  @override
  void initState() {
    super.initState();
    Provider.of<NewsAticalListViewModel>(context, listen: false)
        .populetTopHeadLines();
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<NewsAticalListViewModel>(context);
    return SafeArea(
      child: Scaffold(
        body: ListView.builder(
          itemCount: vm.artical.length,
          itemBuilder: (context, index) {
            final artical = vm.artical[index];
            return ListTile(
              leading: Container(
                  width: 100,
                  height: 100,
                  child: artical.imageUrl == null
                      ? Image.asset('images/image1.jpg')
                      : Image.network(artical.imageUrl)),
              title: Text(artical.title),
            );
          },
        ),
      ),
    );
  }
}
