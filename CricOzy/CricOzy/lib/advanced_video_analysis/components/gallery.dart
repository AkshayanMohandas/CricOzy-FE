// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:video_player/video_player.dart';

// class GalleryPage extends StatefulWidget {
//   @override
//   _GalleryPageState createState() => _GalleryPageState();
// }

// class _GalleryPageState extends State<GalleryPage> {
//   VideoPlayerController _videoPlayerController;
//   Future<void> _initializeVideoPlayerFuture;

//   Future<void> _pickVideoFromGallery() async {
//     final pickedFile = await ImagePicker().getVideo(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       _videoPlayerController = VideoPlayerController.file(File(pickedFile.path));
//       _initializeVideoPlayerFuture = _videoPlayerController.initialize();
//       setState(() {});
//     }
//   }

//   @override
//   void dispose() {
//     _videoPlayerController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Gallery Page'),
//       ),
//       body: Center(
//         child: _videoPlayerController != null && _videoPlayerController.value.initialized
//             ? AspectRatio(
//                 aspectRatio: _videoPlayerController.value.aspectRatio,
//                 child: VideoPlayer(_videoPlayerController),
//               )
//             : Text('No video selected'),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _pickVideoFromGallery,
//         tooltip: 'Pick Video',
//         child: Icon(Icons.video_library),
//       ),
//     );
//   }
// }
