import 'package:best_flutter_ui_templates/advanced_video_analysis/components/CameraScreen.dart';
import 'package:best_flutter_ui_templates/advanced_video_analysis/components/homepage.dart';
import 'package:best_flutter_ui_templates/model/help_screen.dart';
import 'package:best_flutter_ui_templates/others/design_course/category_list_view.dart';
import 'package:best_flutter_ui_templates/others/design_course/course_info_screen.dart';
import 'package:best_flutter_ui_templates/main.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'design_course_app_theme.dart';

class DesignCourseHomeScreen extends StatefulWidget {
  @override
  _DesignCourseHomeScreenState createState() => _DesignCourseHomeScreenState();
}

class _DesignCourseHomeScreenState extends State<DesignCourseHomeScreen> {
  CategoryType categoryType = CategoryType.ui;

  int _hoverIndex = -1;

  List<Map<String, dynamic>> _buttonList = [
    {"image": "assets/images/supportIcon.png", "label": "Open Camera"},
    {"image": "assets/images/supportIcon.png", "label": "Upload Video"},
    {"image": "assets/images/supportIcon.png", "label": "Stats"},
    {"image": "assets/images/supportIcon.png", "label": "Help"},
  ];
  bool multiple = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: DesignCourseAppTheme.nearlyWhite,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).padding.top,
            ),
            // getAppBarUI(),
            // appBar(),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: <Widget>[
                      getSearchBarUI(),
                      // getCategoryUI(),
                      Flexible(
                        child: getPopularCourseUI(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getCategoryUI() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 18, right: 16),
          child: Text(
            'Category',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 22,
              letterSpacing: 0.27,
              color: DesignCourseAppTheme.darkerText,
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Row(
            children: <Widget>[
              getButtonUI(CategoryType.ui, categoryType == CategoryType.ui),
              const SizedBox(
                width: 16,
              ),
              getButtonUI(
                  CategoryType.coding, categoryType == CategoryType.coding),
              const SizedBox(
                width: 16,
              ),
              getButtonUI(
                  CategoryType.basic, categoryType == CategoryType.basic),
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        CategoryListView(
          callBack: () {
            moveTo();
          },
        ),
      ],
    );
  }

  Widget getPopularCourseUI() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Popular Course',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 22,
              letterSpacing: 0.27,
              color: DesignCourseAppTheme.darkerText,
            ),
          ),
          Positioned(
            top: 100,
            child: InkWell(
              onTap: () async {
                List<CameraDescription> cameras = await availableCameras();
                if (cameras.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          TakePictureScreen(camera: cameras[0]),
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
                      color: _hoverIndex == 0 ? Colors.grey : Colors.white,
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
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
                      color: _hoverIndex == 1 ? Colors.grey : Colors.white,
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
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
                      color: _hoverIndex == 2 ? Colors.grey : Colors.white,
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HelpScreen()));
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
                      color: _hoverIndex == 3 ? Colors.grey : Colors.white,
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

          // Flexible(
          //   child: PopularCourseListView(
          //     callBack: () {
          //       moveTo();
          //     },
          //   ),
          // )
        ],
      ),
    );
  }

  void moveTo() {
    Navigator.push<dynamic>(
      context,
      MaterialPageRoute<dynamic>(
        builder: (BuildContext context) => CourseInfoScreen(),
      ),
    );
  }

  Widget getButtonUI(CategoryType categoryTypeData, bool isSelected) {
    String txt = '';
    if (CategoryType.ui == categoryTypeData) {
      txt = 'Ui/Ux';
    } else if (CategoryType.coding == categoryTypeData) {
      txt = 'Coding';
    } else if (CategoryType.basic == categoryTypeData) {
      txt = 'Basic UI';
    }
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: isSelected
                ? DesignCourseAppTheme.nearlyBlue
                : DesignCourseAppTheme.nearlyWhite,
            borderRadius: const BorderRadius.all(Radius.circular(24.0)),
            border: Border.all(color: DesignCourseAppTheme.nearlyBlue)),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: Colors.white24,
            borderRadius: const BorderRadius.all(Radius.circular(24.0)),
            onTap: () {
              setState(() {
                categoryType = categoryTypeData;
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 12, bottom: 12, left: 18, right: 18),
              child: Center(
                child: Text(
                  txt,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    letterSpacing: 0.27,
                    color: isSelected
                        ? DesignCourseAppTheme.nearlyWhite
                        : DesignCourseAppTheme.nearlyBlue,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget getSearchBarUI() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * 0.75,
            height: 64,
            child: Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              child: Container(
                decoration: BoxDecoration(
                  color: HexColor('#F8FAFB'),
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(13.0),
                    bottomLeft: Radius.circular(13.0),
                    topLeft: Radius.circular(13.0),
                    topRight: Radius.circular(13.0),
                  ),
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: TextFormField(
                          style: TextStyle(
                            fontFamily: 'WorkSans',
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: DesignCourseAppTheme.nearlyBlue,
                          ),
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: 'Search for course',
                            border: InputBorder.none,
                            helperStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: HexColor('#B9BABC'),
                            ),
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              letterSpacing: 0.2,
                              color: HexColor('#B9BABC'),
                            ),
                          ),
                          onEditingComplete: () {},
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: Icon(Icons.search, color: HexColor('#B9BABC')),
                    )
                  ],
                ),
              ),
            ),
          ),
          const Expanded(
            child: SizedBox(),
          )
        ],
      ),
    );
  }

  // Widget appBar() {
  //   var brightness = MediaQuery.of(context).platformBrightness;
  //   bool isLightMode = brightness == Brightness.light;
  //   return SizedBox(
  //     height: AppBar().preferredSize.height,
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: <Widget>[
  //         Padding(
  //           padding: const EdgeInsets.only(top: 8, left: 8),
  //           child: Container(
  //             width: AppBar().preferredSize.height - 8,
  //             height: AppBar().preferredSize.height - 8,
  //           ),
  //         ),
  //         Expanded(
  //           child: Center(
  //             child: Padding(
  //               padding: const EdgeInsets.only(top: 4),
  //               child: Text(
  //                 'CricOzy',
  //                 style: TextStyle(
  //                   fontSize: 22,
  //                   color: isLightMode ? AppTheme.darkText : AppTheme.white,
  //                   fontWeight: FontWeight.w700,
  //                 ),
  //               ),
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget getAppBarUI() {
    return Scaffold();
    // padding: const EdgeInsets.only(top: 8.0, left: 18, right: 18),
    //   child: Row(
    //     children: <Widget>[
    //       Expanded(
    //         child: Column(
    //           mainAxisAlignment: MainAxisAlignment.end,
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: <Widget>[
    //             Text(
    //               'Choose your',
    //               textAlign: TextAlign.left,
    //               style: TextStyle(
    //                 fontWeight: FontWeight.w400,
    //                 fontSize: 14,
    //                 letterSpacing: 0.2,
    //                 color: DesignCourseAppTheme.grey,
    //               ),
    //             ),
    //             Text(
    //               'Design Course',
    //               textAlign: TextAlign.left,
    //               style: TextStyle(
    //                 fontWeight: FontWeight.bold,
    //                 fontSize: 22,
    //                 letterSpacing: 0.27,
    //                 color: DesignCourseAppTheme.darkerText,
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //       Container(
    //         width: 60,
    //         height: 60,
    //         child: Image.asset('assets/design_course/userImage.png'),
    //       )
    //     ],
    //   ),
    // );
  }
}

enum CategoryType {
  ui,
  coding,
  basic,
}
