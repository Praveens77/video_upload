import 'dart:io';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class Home1 extends StatefulWidget {
  // File? sub1;
  // Home1({
  //   required this.sub1,
  // });
  @override
  State<Home1> createState() => _Home1State();
}

class _Home1State extends State<Home1> {
  // File? sub1;
  // _Home1State({
  //   required this.sub1,
  // });
  VideoPlayerController? _controller;

  @override
  void initState() {
    super.initState();

    // _controller = VideoPlayerController.file(sub1!)
    //   ..initialize().then((_) {
    //     setState(() {});
    //   });

    _controller = VideoPlayerController.network(
      'https://firebasestorage.googleapis.com/v0/b/upload-files-65ba8.appspot.com/o/files%2Ffile_example_MP4_1280_10MG.mp4?alt=media&token=e48840cf-4884-4f14-88c2-bab9cd06bcdb',
    )..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    final chewieController = ChewieController(
      videoPlayerController: _controller!,
      autoPlay: true,
      looping: true,
    );
    return Scaffold(
      body: Center(
        child: _controller!.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller!.value.aspectRatio,
                child: Chewie(
                  controller: chewieController,
                ),
              )
            : Container(),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller!.dispose();
  }
}
