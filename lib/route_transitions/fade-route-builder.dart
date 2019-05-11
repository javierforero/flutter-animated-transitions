import 'package:flutter/material.dart';

class FadeRouteBuilder<T> extends PageRouteBuilder<T> {
  final Widget page;

  FadeRouteBuilder({@required this.page})
      : super(
          pageBuilder: (context, animation1, animation2) => page,
          transitionsBuilder:
              (BuildContext context, animation1, animation2, Widget child) {
            return FadeTransition(
              opacity: animation1,
              child: child,
            );
          },
        );
}
