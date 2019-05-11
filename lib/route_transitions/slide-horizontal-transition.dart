import 'package:flutter/material.dart';
import 'package:transitions_flutter_app/consts/trasition_consts.dart';

/*
* SlideHorizontalRouteBuilder is a class that extends PageRouteBuilder.
* It takes two params @pageWidget and @customPageBuilder.
* Choose to pass in either @pageWidget or @customPageBuilder.
* Usage:
*  Use @pageWidget if the destination page doesn't have animations
*  that depend on router animation controller
*
*  Use @customPageBuilder if you have animations on destination page
*  that need to be triggered at the same time as the navigation
*
*
* */

class SlideHorizontalRouteBuilder extends PageRouteBuilder {
  static RoutePageBuilder defaultPageBuilder(Widget widget) {
    return (BuildContext context, Animation animation,
        Animation secondaryAnimation) {
      return widget;
    };
  }

  final RoutePageBuilder customPageBuilder;
  final Widget pageWidget;
  final String routeName;
  static final Animatable<Offset> myTween = Tween<Offset>(
    begin: const Offset(
      kSlideHorizontalBeginXOffset,
      kSlideHorizontalEndXOffset,
    ),
    end: Offset.zero,
  ).chain(
    CurveTween(
      curve: Curves.bounceInOut,
    ),
  );

  SlideHorizontalRouteBuilder({
    this.routeName,
    this.pageWidget,
    this.customPageBuilder,
  }) : super(
          settings: RouteSettings(
            name: routeName,
          ),
          pageBuilder: customPageBuilder ?? defaultPageBuilder(pageWidget),
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            return SlideTransition(
              position: animation.drive(myTween),
              child: child,
            );
          },
          transitionDuration: Duration(
            milliseconds: 200,
          ),
        );
}
