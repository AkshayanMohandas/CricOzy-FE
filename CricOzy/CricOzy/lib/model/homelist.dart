import 'package:best_flutter_ui_templates/advanced_video_analysis/introduction_animation_screen.dart';
import 'package:best_flutter_ui_templates/others/design_course/home_design_course.dart';
import 'package:best_flutter_ui_templates/speedOmeter/first_page.dart';
import 'package:flutter/widgets.dart';
import '../others/fitness_app/fitness_app_home_screen.dart';
import '../toss_spinner/toss_spinner.dart';
import '../weather/weather_page.dart';

// class HomeList {
//   HomeList({
//     this.navigateScreen,
//     this.imagePath = '',
//   });

//   Widget? navigateScreen;
//   String imagePath;

//   static List<HomeList> homeList = [
//     // HomeList(
//     //   imagePath: 'assets/introduction_animation/introduction_image.png',
//     // ),
//     HomeList(
//       imagePath: 'assets/images/ProgressTrack.gif',
//       navigateScreen: IntroductionAnimationScreen(),
//     ),
//     HomeList(
//       imagePath: 'assets/images/Toss.gif',
//       navigateScreen: CoinToss(),
//     ),
//     HomeList(
//       imagePath: 'assets/images/fitness.gif',
//       navigateScreen: FitnessAppHomeScreen(),
//     ),
//     HomeList(
//       imagePath: 'assets/images/SpeedOmeter1.gif',
//       navigateScreen: FirstPage(),
//     ),
//     HomeList(
//       imagePath: 'assets/images/Weather.gif',
//       navigateScreen: WeatherPage(),
//     ),
//     HomeList(
//       imagePath: 'assets/design_course/design_course.png',
//       navigateScreen: DesignCourseHomeScreen(),
//     ),
//   ];
// }

class HomeList {
  HomeList({
    this.navigateScreen,
    this.imagePath = '',
    this.label = '',
  });

  String label;
  Widget? navigateScreen;
  String imagePath;

  static List<HomeList> homeList = [
    HomeList(
      label: 'PROGRESS TRACKER',
      imagePath: 'assets/images/ProgressTrack.gif',
      navigateScreen: IntroductionAnimationScreen(),
    ),
    HomeList(
      label: 'COIN TOSS',
      imagePath: 'assets/images/Toss.gif',
      navigateScreen: CoinToss(),
    ),
    HomeList(
      label: 'FITNESS APP',
      imagePath: 'assets/images/fitness.gif',
      navigateScreen: FitnessAppHomeScreen(),
    ),
    HomeList(
      label: 'SPEEDOMETER',
      imagePath: 'assets/images/SpeedOmeter1.gif',
      navigateScreen: FirstPage(),
    ),
    HomeList(
      label: 'WEATHER',
      imagePath: 'assets/images/Weather.gif',
      navigateScreen: WeatherPage(),
    ),
    HomeList(
      label: 'DESIGN COURSE',
      imagePath: 'assets/design_course/design_course.png',
      navigateScreen: DesignCourseHomeScreen(),
    ),
  ];
}
