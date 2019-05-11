import 'package:flutter/material.dart';
import 'package:rect_getter/rect_getter.dart';

class RippleFadeTransitionPage extends StatefulWidget {
  final _RippleFadeTransitionPageState _rippleState =
      _RippleFadeTransitionPageState();
  getKey() => _rippleState.rectGetterkey;
  @override
  State<StatefulWidget> createState() => _rippleState;
}

class _RippleFadeTransitionPageState extends State<RippleFadeTransitionPage>
    with TickerProviderStateMixin {
  GlobalKey rectGetterkey = RectGetter.createGlobalKey();
  Rect rect;

  @override
  void initState() {
    super.initState();
    rect = RectGetter.getRectFromKey(rectGetterkey);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Scaffold(
//          backgroundColor: Colors.black,
          appBar: AppBar(
            elevation: 0.0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              color: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: SafeArea(
            bottom: false,
            child: Container(
              child: Text('fade page'),
            ),
          ),
        ),
        _Ripple(
          rect: this.rect,
        ),
      ],
    );
  }
}

class _Ripple extends StatelessWidget {
  final Rect rect;
  _Ripple({@required this.rect});

  @override
  Widget build(BuildContext context) {
    if (rect == null) {
      return Container();
    }

    return Positioned(
      left: rect.left,
      right: MediaQuery.of(context).size.width - rect.right,
      top: rect.top,
      bottom: MediaQuery.of(context).size.width - rect.bottom,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).accentColor,
        ),
      ),
    );
  }
}
