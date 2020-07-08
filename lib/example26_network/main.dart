import 'package:flutter/material.dart';
import 'package:fluttermyexample/example26_network/model/githubmodel.dart';
import 'package:fluttermyexample/example26_network/screen/homepage.dart';
import 'package:fluttermyexample/example26_network/screen/repositorylist.dart';
import 'package:provider/provider.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (c) => GithubModel()),
      ],
      child: MaterialApp(
        routes: {
      "/": (c) => HomePage(),
      "/repository": (c) => Repos(),
      },
      ),
    );
  }

}