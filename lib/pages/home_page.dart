import 'package:flutter/material.dart';
import 'package:rect_getter/rect_getter.dart';
import 'package:transitions_flutter_app/pages/ripple_fade_transition_page.dart';
import 'package:transitions_flutter_app/pages/slide_transition_page.dart';
import 'package:transitions_flutter_app/route_transitions/slide-horizontal-transition.dart';

import '../routes.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final RippleFadeTransitionPage _rippleFadePage = RippleFadeTransitionPage();
    return Scaffold(
      appBar: AppBar(
        title: Text('Transitions'),
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: 15.0,
            right: 15.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 30.0,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      padding: EdgeInsets.all(14.0),
                      elevation: 0.0,
                      color: Theme.of(context).accentColor,
                      child: Text(
                        'Slide transition 1',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          SlideHorizontalRouteBuilder(
                            routeName: Routes.transitionPage,
                            customPageBuilder: (
                              BuildContext context,
                              Animation animation,
                              Animation secondaryAnimation,
                            ) {
                              return TransitionPage(
                                animation: animation,
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: RectGetter(
        key: _rippleFadePage.getKey(),
        child: FloatingActionButton(
          isExtended: true,
          child: Text('Ripple'),
          onPressed: () {
//            Navigator.of(context).push(
//              FadeRouteBuilder(
//                page: _rippleFadePage,
//              ),
//            );
          },
        ),
      ),
    );
  }
}
