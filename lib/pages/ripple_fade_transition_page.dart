import 'package:flutter/material.dart';

class RippleFadeTransitionPage extends StatefulWidget {
  final Rect rect;
  final Animation<double> animation;

  RippleFadeTransitionPage({@required this.rect, @required this.animation});

  @override
  State<StatefulWidget> createState() => _RippleFadeTransitionPageState();
}

class _RippleFadeTransitionPageState extends State<RippleFadeTransitionPage>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
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
          backgroundColor: Colors.black,
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
          body: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Positioned(
                bottom: MediaQuery.of(context).size.height - widget.rect.bottom,
                right: MediaQuery.of(context).size.width - widget.rect.right,
                child: _Ripple(
                  rect: widget.rect,
                  animation: widget.animation,
                ),
              ),
              Container(
                child: Text('fade page'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _Ripple extends StatelessWidget {
  final Rect rect;
  final Animation animation;
  _Ripple({@required this.rect, this.animation});

  @override
  Widget build(BuildContext context) {
    if (rect == null) {
      return Container();
    }
    return ScaleTransition(
      scale: animation.drive(
        Tween(
          begin: 1.0,
          end: 31,
        ),
      ),
      child: Container(
        height: rect.height,
        width: rect.width,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
      ),
    );
  }
}
