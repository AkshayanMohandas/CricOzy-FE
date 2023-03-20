import 'package:best_flutter_ui_templates/model/help_screen.dart';
import 'package:camera/camera.dart';
import 'CameraScreen.dart';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _hoverIndex = -1;

  List<Map<String, dynamic>> _buttonList = [
    {"image": "assets/images/camera_icon.png", "label": "Open Camera"},
    {"image": "assets/images/gallery_icon.png", "label": "Upload Video"},
    {"image": "assets/images/statics_icon.png", "label": "Stats"},
    {"image": "assets/images/help_icon.png", "label": "Help"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(255, 248, 236, 228),
      appBar: AppBar(
        elevation: 0,
        // ignore: deprecated_member_use
        brightness: Brightness.light,
        backgroundColor: Color.fromARGB(255, 248, 236, 228),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: Stack(
        children: [
          // Positioned(
          //   child: Container(
          //     decoration: BoxDecoration(
          //       boxShadow: [
          //         BoxShadow(
          //           color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
          //           spreadRadius: 5,
          //           blurRadius: 7,
          //           offset: Offset(0, 3),
          //         ),
          //       ],
          //       borderRadius: BorderRadius.circular(20),
          //     ),
          //     child: Image.asset(
          //       "assets/images/posenet.png",
          //       fit: BoxFit.cover,
          //     ),
          //   ),
          //   top: null,
          //   bottom: null,
          //   left: null,
          //   right: null,
          //   width: MediaQuery.of(context).size.width / 2,
          //   height: MediaQuery.of(context).size.height / 2,
          // ),
          Positioned(
            top: 100,
            left: 40,
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
        ],
      ),
    );
  }
}

// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       backgroundColor: Color.fromARGB(255, 248, 236, 228),
//       appBar: AppBar(
//         elevation: 0,
//         brightness: Brightness.light,
//         backgroundColor: Color.fromARGB(255, 248, 236, 228),
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: Icon(
//             Icons.arrow_back_ios,
//             size: 20,
//             color: Colors.black,
//           ),
//         ),
//       ),
//       body: Container(
//         height: MediaQuery.of(context).size.height,
//         width: double.infinity,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: <Widget>[
//             Expanded(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: <Widget>[
//                   Column(
//                     children: <Widget>[
//                       Text(
//                         "Advanced Video Analysis",
//                         style: TextStyle(
//                             fontSize: 30, fontWeight: FontWeight.bold),
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       Text(
//                         "Video Input Will Provide the Static",
//                         style: TextStyle(fontSize: 15, color: Colors.grey[700]),
//                       ),
//                     ],
//                   ),
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 40),
//                     child: Container(
//                       padding: EdgeInsets.only(top: 3, left: 3),
//                       // decoration: BoxDecoration(
//                       //     borderRadius: BorderRadius.circular(50),
//                       //     border: Border(
//                       //       bottom: BorderSide(color: Colors.black),
//                       //       top: BorderSide(color: Colors.black),
//                       //       left: BorderSide(color: Colors.black),
//                       //       right: BorderSide(color: Colors.black),
//                       //     )),
//                       child: MaterialButton(
//                         minWidth: double.infinity,
//                         height: 60,
//                         onPressed: () async {
//                           List<CameraDescription> cameras =
//                               await availableCameras();
//                           if (cameras.isNotEmpty) {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) =>
//                                     TakePictureScreen(camera: cameras[0]),
//                               ),
//                             );
//                           } else {
//                             // Handle the case where no cameras are available
//                             print('No cameras available');
//                           }
//                         },
//                         color: Color.fromARGB(255, 203, 184, 153),
//                         elevation: 0,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(50),
//                         ),
//                         child: Text(
//                           "Open Camera",
//                           style: TextStyle(
//                             fontWeight: FontWeight.w600,
//                             fontSize: 18,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 40),
//                     child: Container(
//                       padding: EdgeInsets.only(top: 3, left: 3),
//                       // decoration: BoxDecoration(
//                       //     borderRadius: BorderRadius.circular(50),
//                       //     border: Border(
//                       //       bottom: BorderSide(color: Colors.black),
//                       //       top: BorderSide(color: Colors.black),
//                       //       left: BorderSide(color: Colors.black),
//                       //       right: BorderSide(color: Colors.black),
//                       //     )),
//                       child: MaterialButton(
//                         minWidth: double.infinity,
//                         height: 60,
//                         onPressed: () {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => HomePage()));
//                         },
//                         color: Color.fromARGB(255, 198, 161, 101),
//                         elevation: 0,
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(50)),
//                         child: Text(
//                           "Upload Video",
//                           style: TextStyle(
//                               fontWeight: FontWeight.w600, fontSize: 18),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 40),
//                     child: Container(
//                       padding: EdgeInsets.only(top: 3, left: 3),
//                       // decoration: BoxDecoration(
//                       //     borderRadius: BorderRadius.circular(50),
//                       //     border: Border(
//                       //       bottom: BorderSide(color: Colors.black),
//                       //       top: BorderSide(color: Colors.black),
//                       //       left: BorderSide(color: Colors.black),
//                       //       right: BorderSide(color: Colors.black),
//                       //     )),
//                       child: MaterialButton(
//                         minWidth: double.infinity,
//                         height: 60,
//                         onPressed: () {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => HomePage()));
//                         },
//                         color: Color.fromARGB(255, 149, 110, 48),
//                         elevation: 0,
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(50)),
//                         child: Text(
//                           "View Stats",
//                           style: TextStyle(
//                               fontWeight: FontWeight.w600, fontSize: 18),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 40),
//                     child: Container(
//                       padding: EdgeInsets.only(top: 3, left: 3),
//                       // decoration: BoxDecoration(
//                       //     borderRadius: BorderRadius.circular(50),
//                       //     border: Border(
//                       //       bottom: BorderSide(color: Colors.black),
//                       //       top: BorderSide(color: Colors.black),
//                       //       left: BorderSide(color: Colors.black),
//                       //       right: BorderSide(color: Colors.black),
//                       //     )),
//                       child: MaterialButton(
//                         minWidth: double.infinity,
//                         height: 60,
//                         onPressed: () {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => HelpScreen()));
//                         },
//                         color: Color.fromARGB(255, 106, 72, 19),
//                         elevation: 0,
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(50)),
//                         child: Text(
//                           "Help",
//                           style: TextStyle(
//                               fontWeight: FontWeight.w600, fontSize: 18),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget makeInput({label, obscureText = false}) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         Text(
//           label,
//           style: TextStyle(
//               fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
//         ),
//         SizedBox(
//           height: 5,
//         ),
//         TextField(
//           obscureText: obscureText,
//           decoration: InputDecoration(
//             contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
//           ),
//         ),
//         SizedBox(
//           height: 30,
//         ),
//       ],
//     );
//   }
// }


//////2

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   int _hoverIndex = -1;

//   List<Map<String, dynamic>> _buttonList = [
//     {"image": "assets/images/supportIcon.png"},
//     {"image": "assets/images/supportIcon.png"},
//     {"image": "assets/images/supportIcon.png"},
//     {"image": "assets/images/supportIcon.png"},
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       backgroundColor: Color.fromARGB(255, 248, 236, 228),
//       appBar: AppBar(
//         elevation: 0,
//         brightness: Brightness.light,
//         backgroundColor: Color.fromARGB(255, 248, 236, 228),
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: Icon(
//             Icons.arrow_back_ios,
//             size: 20,
//             color: Colors.black,
//           ),
//         ),
//       ),
//       body: Center(
//         child:
//             Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               InkWell(
//                 onTap: () async {
//                   List<CameraDescription> cameras = await availableCameras();
//                   if (cameras.isNotEmpty) {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) =>
//                             TakePictureScreen(camera: cameras[0]),
//                       ),
//                     );
//                   } else {
//                     // Handle the case where no cameras are available
//                     print('No cameras available');
//                   }
//                 },
//                 onHover: (value) {
//                   setState(() {
//                     _hoverIndex = value ? 0 : -1;
//                   });
//                 },
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: _hoverIndex == 0 ? Colors.grey : Colors.white,
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Image.asset(
//                       _buttonList[0]["image"],
//                       width: 100,
//                       height: 100,
//                     ),
//                   ),
//                 ),
//               ),
//               InkWell(
//                 onTap: () {
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => HomePage()));
//                 },
//                 onHover: (value) {
//                   setState(() {
//                     _hoverIndex = value ? 1 : -1;
//                   });
//                 },
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: _hoverIndex == 1 ? Colors.grey : Colors.white,
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Image.asset(
//                       _buttonList[1]["image"],
//                       width: 100,
//                       height: 100,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               InkWell(
//                 onTap: () {
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => HomePage()));
//                 },
//                 onHover: (value) {
//                   setState(() {
//                     _hoverIndex = value ? 2 : -1;
//                   });
//                 },
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: _hoverIndex == 2 ? Colors.grey : Colors.white,
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Image.asset(
//                       _buttonList[2]["image"],
//                       width: 100,
//                       height: 100,
//                     ),
//                   ),
//                 ),
//               ),
//               InkWell(
//                 onTap: () {
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => HomePage()));
//                 },
//                 onHover: (value) {
//                   setState(() {
//                     _hoverIndex = value ? 3 : -1;
//                   });
//                 },
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: _hoverIndex == 3 ? Colors.grey : Colors.white,
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Image.asset(
//                       _buttonList[3]["image"],
//                       width: 100,
//                       height: 100,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ]),
//       ),
//     );
//   }
// }
