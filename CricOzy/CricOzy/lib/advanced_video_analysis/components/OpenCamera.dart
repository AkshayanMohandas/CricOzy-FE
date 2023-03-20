// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:camera/camera.dart';

// void main() async {
//   // Ensure that plugin services are initialized
//   WidgetsFlutterBinding.ensureInitialized();

//   // Obtain a list of the available cameras on the device
//   final cameras = await availableCameras();

//   // Get the first camera from the list
//   final firstCamera = cameras.first;

//   runApp(MyApp(camera: firstCamera));
// }

// class MyApp extends StatefulWidget {
//   final CameraDescription camera;

//   const MyApp({Key? key, required this.camera}) : super(key: key);

//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   late CameraController _controller;
//   late Future<void> _initializeControllerFuture;

//   @override
//   void initState() {
//     super.initState();

//     // Create a CameraController and initialize it with the given camera
//     _controller = CameraController(widget.camera, ResolutionPreset.medium);

//     // Next, initialize the controller. This returns a Future
//     _initializeControllerFuture = _controller.initialize();
//   }

//   @override
//   void dispose() {
//     // Dispose of the controller when the widget is disposed
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: Text('Camera Example')),
//         body: FutureBuilder<void>(
//           future: _initializeControllerFuture,
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.done) {
//               // If the Future is complete, display the preview
//               return CameraPreview(_controller);
//             } else {
//               // Otherwise, display a loading indicator
//               return Center(child: CircularProgressIndicator());
//             }
//           },
//         ),
//         floatingActionButton: FloatingActionButton(
//           child: Icon(Icons.camera_alt),
//           // When the user taps the button, take a picture
//           onPressed: () async {
//             try {
//               // Ensure that the camera is initialized before taking a picture
//               await _initializeControllerFuture;

//               // Attempt to take a picture and get the file location
//               final image = await _controller.takePicture();

//               // If the picture was taken successfully, navigate to a new screen to display it
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) =>
//                           DisplayPictureScreen(imagePath: image.path)));
//             } catch (e) {
//               // If an error occurs, log the error to the console
//               print(e);
//             }
//           },
//         ),
//       ),
//     );
//   }
// }

// class DisplayPictureScreen extends StatelessWidget {
//   final String imagePath;

//   const DisplayPictureScreen({Key? key, required this.imagePath})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Picture')),
//       body: Image.file(File(imagePath)),
//     );
//   }
// }
