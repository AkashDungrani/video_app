import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../models/globals.dart';

class Display extends StatefulWidget {
  const Display({super.key});

  @override
  State<Display> createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
  late VideoPlayerController videoPlayerController;
  late ChewieController chewieController;
  Future<void> loadvideo() async {
    videoPlayerController = VideoPlayerController.network(currentdata["video"]);
    // videoPlayerController =
    //     VideoPlayerController.asset("assets/videos/banana.mp4");
    await videoPlayerController.initialize();
    setState(() {});
    chewieController = ChewieController(
        videoPlayerController: videoPlayerController,
        autoInitialize: true,
        autoPlay: false);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadvideo();
    chewieController =
        ChewieController(videoPlayerController: videoPlayerController);
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> diplay =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      appBar:
          AppBar(backgroundColor: Colors.black, title: Text(diplay["name"])),
      body: Container(
        alignment: Alignment.center,
        child: AspectRatio(
          aspectRatio: videoPlayerController.value.aspectRatio,
          child: Chewie(controller: chewieController),
        ),
      ),
    );
  }
}
