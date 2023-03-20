import 'package:best_flutter_ui_templates/advanced_video_analysis/components/CameraScreen.dart';
import 'package:best_flutter_ui_templates/advanced_video_analysis/components/homepage.dart';
import 'package:best_flutter_ui_templates/model/help_screen.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'design_course_app_theme.dart';

class CourseInfoScreen extends StatefulWidget {
  @override
  _CourseInfoScreenState createState() => _CourseInfoScreenState();
}

class _CourseInfoScreenState extends State<CourseInfoScreen>
    with TickerProviderStateMixin {
  final double infoHeight = 364.0;
  AnimationController? animationController;
  Animation<double>? animation;
  double opacity1 = 0.0;
  double opacity2 = 0.0;
  double opacity3 = 0.0;
  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: animationController!,
        curve: Interval(0, 1.0, curve: Curves.fastOutSlowIn)));
    setData();
    super.initState();
  }

  int _hoverIndex = -1;

  List<Map<String, dynamic>> _buttonList = [
    {"image": "assets/images/supportIcon.png", "label": "Open Camera"},
    {"image": "assets/images/supportIcon.png", "label": "Upload Video"},
    {"image": "assets/images/supportIcon.png", "label": "Stats"},
    {"image": "assets/images/supportIcon.png", "label": "Help"},
  ];

  Future<void> setData() async {
    animationController?.forward();
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity1 = 1.0;
    });
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity2 = 1.0;
    });
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity3 = 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double tempHeight = MediaQuery.of(context).size.height -
        (MediaQuery.of(context).size.width / 1.2) +
        24.0;
    return Container(
      color: Color.fromARGB(255, 248, 236, 228),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 1.2,
                  child: Image.asset('assets/design_course/webInterFace.png'),
                ),
              ],
            ),
            Flexible(
              child: Positioned(
                top: (MediaQuery.of(context).size.width / 1.2) - 24.0,
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 248, 236, 228),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(32.0),
                        topRight: Radius.circular(32.0)),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: DesignCourseAppTheme.grey.withOpacity(0.2),
                          offset: const Offset(1.1, 1.1),
                          blurRadius: 10.0),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: SingleChildScrollView(
                      child: Container(
                        constraints: BoxConstraints(
                            minHeight: infoHeight,
                            maxHeight: tempHeight > infoHeight
                                ? tempHeight
                                : infoHeight),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Positioned(
                              top: 100,
                              left: 40,
                              child: InkWell(
                                onTap: () async {
                                  List<CameraDescription> cameras =
                                      await availableCameras();
                                  if (cameras.isNotEmpty) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => TakePictureScreen(
                                            camera: cameras[0]),
                                      ),
                                    );
                                  } else {
                                    // Handle the case where no cameras are available
                                    print('No cameras available');
                                  }
                                },
                                onHover: (value) {
                                  setState(() {
                                    _hoverIndex = value ? 0 : -1;
                                  });
                                },
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: _hoverIndex == 0
                                            ? Colors.grey
                                            : Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.asset(
                                          _buttonList[0]["image"],
                                          width: 100,
                                          height: 100,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      _buttonList[0]["label"],
                                      style: TextStyle(fontSize: 18),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              top: 100,
                              right: 40,
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomePage()));
                                },
                                onHover: (value) {
                                  setState(() {
                                    _hoverIndex = value ? 1 : -1;
                                  });
                                },
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: _hoverIndex == 1
                                            ? Colors.grey
                                            : Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.asset(
                                          _buttonList[1]["image"],
                                          width: 100,
                                          height: 100,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      _buttonList[1]["label"],
                                      style: TextStyle(fontSize: 18),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              top: 380,
                              left: 40,
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomePage()));
                                },
                                onHover: (value) {
                                  setState(() {
                                    _hoverIndex = value ? 2 : -1;
                                  });
                                },
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: _hoverIndex == 2
                                            ? Colors.grey
                                            : Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.asset(
                                          _buttonList[2]["image"],
                                          width: 100,
                                          height: 100,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      _buttonList[2]["label"],
                                      style: TextStyle(fontSize: 18),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              top: 380,
                              right: 40,
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HelpScreen()));
                                },
                                onHover: (value) {
                                  setState(() {
                                    _hoverIndex = value ? 3 : -1;
                                  });
                                },
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: _hoverIndex == 3
                                            ? Colors.grey
                                            : Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.asset(
                                          _buttonList[3]["image"],
                                          width: 100,
                                          height: 100,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      _buttonList[3]["label"],
                                      style: TextStyle(fontSize: 18),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              child: SizedBox(
                width: AppBar().preferredSize.height,
                height: AppBar().preferredSize.height,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius:
                        BorderRadius.circular(AppBar().preferredSize.height),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: DesignCourseAppTheme.nearlyBlack,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
