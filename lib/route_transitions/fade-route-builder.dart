import 'package:flutter/material.dart';

class FadeRouteBuilder<T> extends PageRouteBuilder<T> {
  static RoutePageBuilder defaultPageBuilder(Widget widget) {
    return (BuildContext context, Animation animation,
        Animation secondaryAnimation) {
      return widget;
    };
  }

  final RoutePageBuilder customPageBuilder;
  final Widget pageWidget;
  final String routeName;

  FadeRouteBuilder({
    this.routeName,
    this.pageWidget,
    this.customPageBuilder,
  }) : super(
          pageBuilder: customPageBuilder ?? defaultPageBuilder(pageWidget),
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          transitionDuration: Duration(
            milliseconds: 200,
          ),
        );
}
