import 'package:flutter/material.dart';
import 'package:transitions_flutter_app/pages/home_page.dart';
import 'package:transitions_flutter_app/pages/slide_transition_page.dart';
import 'package:transitions_flutter_app/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Lato',
        primaryColor: Colors.black,
        accentColor: Colors.blueAccent,
//        pageTransitionsTheme: PageTransitionsTheme(
//            builders: <TargetPlatform, PageTransitionsBuilder>{
//              TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
//              TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
//            }),
      ),
      home: HomePage(),
      routes: {
        Routes.transitionPage: (context) => TransitionPage(),
      },
    );
  }
}
