// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:camera/camera.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:video_player/video_player.dart';

// class CameraPage extends StatefulWidget {
//   @override
//   _CameraPageState createState() => _CameraPageState();
// }

// class _CameraPageState extends State<CameraPage> {
//   CameraController _controller;
//   List<CameraDescription> cameras;
//   bool _isRecording = false;
//   String _videoPath;
//   VideoPlayerController _videoPlayerController;

//   @override
//   void initState() {
//     super.initState();
//     _initializeCamera();
//   }

//   Future<void> _initializeCamera() async {
//     cameras = await availableCameras();
//     _controller = CameraController(cameras[0], ResolutionPreset.high);
//     await _controller.initialize();
//     setState(() {});
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   Future<String> _startRecording() async {
//     if (!_controller.value.isInitialized) {
//       return null;
//     }

//     setState(() {
//       _isRecording = true;
//     });

//     final Directory appDirectory = await getApplicationDocumentsDirectory();
//     final String videoDirectory = '${appDirectory.path}/Videos';
//     await Directory(videoDirectory).create(recursive: true);

//     final String currentTime = DateTime.now().millisecondsSinceEpoch.toString();
//     final String filePath = '$videoDirectory/${currentTime}.mp4';

//     try {
//       await _controller.startVideoRecording(filePath);
//       _videoPath = filePath;
//     } catch (e) {
//       print(e);
//       return null;
//     }

//     return filePath;
//   }

//   Future<void> _stopRecording() async {
//     if (!_controller.value.isRecordingVideo) {
//       return null;
//     }

//     setState(() {
//       _isRecording = false;
//     });

//     try {
//       await _controller.stopVideoRecording();
//     } catch (e) {
//       print(e);
//       return null;
//     }

//     await _playVideo();
//   }

//   Future<void> _playVideo() async {
//     if (_videoPath == null) {
//       return null;
//     }

//     final VideoPlayerController vController =
//         VideoPlayerController.file(File(_videoPath));
//     _videoPlayerController = vController;

//     await _videoPlayerController.initialize();

//     setState(() {});
//     await _videoPlayerController.play();
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (!_controller.value.isInitialized) {
//       return Container();
//     }

//     final Size size = MediaQuery.of(context).size;
//     final double cameraAspectRatio = _controller.value.aspectRatio;

//     return Scaffold(
//       body: Stack(
//         children: <Widget>[
//           Center(
//             child: AspectRatio(
//               aspectRatio: cameraAspectRatio,
//               child: CameraPreview(_controller),
//             ),
//           ),
//           Positioned(
//             bottom: 40,
//             left: 0,
//             right: 0,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: <Widget>[
//                 FloatingActionButton(
//                   onPressed: _isRecording ? null : _startRecording,
//                   child: Icon(_isRecording ? Icons.stop : Icons.videocam),
//                 ),
//                 if (_isRecording)
//                   FloatingActionButton(
//                     onPressed: _isRecording ? _stopRecording : null,
//                     child: Icon(Icons.stop),
//                   ),
//               ],
//             ),
//           ),
//           if (_videoPlayerController != null &&
//               _videoPlayerController.value.initialized)
//             Positioned(
//               top: 0,
//               left: 0,
//               right: 0,
//               bottom: 0,
//               child: AspectRatio(
//                 aspectRatio: _videoPlayerController.value.aspectRatio,
//                 child: VideoPlayer(_videoPlayerController),
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }
