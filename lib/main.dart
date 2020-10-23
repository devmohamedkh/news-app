import 'package:flutter/material.dart';
import 'package:news/viewmodels/newsArticalList_viewmodel.dart';
import 'package:provider/provider.dart';

import 'pages/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
          create: (context) => NewsAticalListViewModel(), child: Home()),
    );
  }
}
