import 'package:flutter/material.dart';
import 'package:transitions_flutter_app/pages/transition_page.dart';
import 'package:transitions_flutter_app/route_transitions/slide-horizontal-transition.dart';

import '../routes.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transitions'),
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            FlatButton(
              color: Theme.of(context).accentColor,
              child: Text('transition 1'),
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
          ],
        ),
      ),
    );
  }
}
