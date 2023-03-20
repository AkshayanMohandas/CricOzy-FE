import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:speedometer/speedometer.dart';
import 'package:rxdart/rxdart.dart';

class SpeedGun extends StatefulWidget {
  // SpeedGun({Key? key, this.title}) : super(key: key);
  // final String title;

  @override
  _SpeedGunState createState() => new _SpeedGunState();
}

class _SpeedGunState extends State<SpeedGun> with TickerProviderStateMixin {
  double _lowerValue = 20.0;
  double _upperValue = 40.0;
  int start = 0;
  int end = 100;

  int counter = 0;

  PublishSubject<double> eventObservable = new PublishSubject();

  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    const oneSec = const Duration(seconds: 1);
    var rng = new Random();
    new Timer.periodic(oneSec,
        (Timer t) => eventObservable.add(rng.nextInt(59) + rng.nextDouble()));
  }

  @override
  void dispose() {
    _animationController.dispose();
    eventObservable.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData somTheme = new ThemeData(
        primaryColor: Colors.blue,
        // ignore: deprecated_member_use
        accentColor: Colors.black,
        backgroundColor: Colors.grey);

    _animationController = AnimationController(vsync: this);

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 248, 236, 228),
      body: Column(
        children: <Widget>[
          Text(
            "\n\n\n\n\nSpeedOMeter\n\n",
            style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: EdgeInsets.all(40.0),
            child: SpeedOMeter(
              start: start,
              end: end,
              highlightStart: (_lowerValue / end),
              highlightEnd: (_upperValue / end),
              themeData: somTheme,
              eventObservable: this.eventObservable,
              // animationController: _animationController,
            ),
          ),
        ],
      ),
    );
  }
}

//
//
// class _SpeedGunState extends State<SpeedGun> {
//   double _lowerValue = 20.0;
//   double _upperValue = 40.0;
//   int start = 0;
//   int end = 100;

//   int counter = 0;

//   PublishSubject<double> eventObservable = new PublishSubject();
//   @override
//   void initState() {
//     super.initState();
//     const oneSec = const Duration(seconds: 1);
//     var rng = new Random();
//     new Timer.periodic(oneSec,
//         (Timer t) => eventObservable.add(rng.nextInt(59) + rng.nextDouble()));
//   }

//   @override
//   Widget build(BuildContext context) {
//     final ThemeData somTheme = new ThemeData(
//         primaryColor: Colors.blue,
//         // ignore: deprecated_member_use
//         accentColor: Colors.black,
//         // ignore: deprecated_member_use
//         backgroundColor: Colors.grey);
//     return new Scaffold(
//         backgroundColor: Color.fromARGB(255, 248, 236, 228),
//         // appBar: new AppBar(
//         //   title: new Text("SpeedOMeter"),
//         //   // bottom: new Text("SpeedOMeter"),
//         // ),
//         body: new Column(
//           children: <Widget>[
//             new Text("\n\n\n\n\nSpeedOMeter\n\n",
//                 style:
//                     new TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold)),
//             new Padding(
//               padding: new EdgeInsets.all(40.0),
//               child: new SpeedOMeter(
//                   start: start,
//                   end: end,
//                   highlightStart: (_lowerValue / end),
//                   highlightEnd: (_upperValue / end),
//                   themeData: somTheme,
//                   eventObservable: this.eventObservable),
//             ),
//           ],
//         ));
//   }
// }
