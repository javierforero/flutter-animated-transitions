import 'package:flutter/material.dart';

class TransitionPage extends StatefulWidget {
  final Animation<double> animation;

  TransitionPage({this.animation});

  @override
  State<StatefulWidget> createState() => _TransitionPageState();
}

class _TransitionPageState extends State<TransitionPage>
    with TickerProviderStateMixin {
  AnimationController _controller;
  AnimationController _controller2;
  static final _myTween = Tween<Offset>(
    begin: Offset(0, 1),
    end: Offset.zero,
  );

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 200,
      ),
    );
    _controller2 = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 550,
      ),
    );
    widget.animation?.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.fling();
      }
    });
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller2.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0.0,
//        title: Text('Transition Page'),
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
          child: SlideTransition(
            position: _controller.drive(_myTween),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(
                  child: Container(
                    color: Colors.white,
                    child: ListView(
                      padding: EdgeInsets.fromLTRB(
                        34.0,
                        10.0,
                        34.0,
                        10.0,
                      ),
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            FadeTransition(
                              opacity: _controller2.drive(
                                Tween(
                                  begin: 0.0,
                                  end: 1.0,
                                ).chain(
                                  CurveTween(
                                    curve: Interval(
                                      0.0,
                                      0.50,
                                    ),
                                  ),
                                ),
                              ),
                              child: Text(
                                'Hello',
                                style: TextStyle(
                                  fontSize: 24.0,
                                  color: Color(0xFF1F1F2B),
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Roboto',
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            FadeTransition(
                              opacity: _controller2.drive(
                                Tween(
                                  begin: 0.0,
                                  end: 2.50,
                                ).chain(
                                  CurveTween(
                                    curve: Interval(
                                      0.40,
                                      1.0,
                                      curve: Curves.easeIn,
                                    ),
                                  ),
                                ),
                              ),
                              child: Text(
                                'long bnody djsadadadsfajsdfls fjxasfjdsafjkadsf sdfjaskjdfksj fsdjfks',
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
