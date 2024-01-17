import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamekare_app/screen/home.dart';
import 'package:hamekare_app/tools/tools.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({Key? key}) : super(key: key);

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late VideoPlayerController videoPlayerController;
  late ChewieController chewieController;
  Widget? chewie;

  initializeVideoPlayer() async {
    videoPlayerController =
        VideoPlayerController.asset("assets/video/logo_motion3.mp4");
    await videoPlayerController.initialize();

    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      autoPlay: true,
      looping: false,
      showControls: false,
      // aspectRatio: 1.5,
      showOptions: false,
    );
    videoPlayerController.addListener(() {
      if (videoPlayerController.value.position ==
          videoPlayerController.value.duration) {
        Get.offAll(() => HomeScreen());
      }
    });

    setState(() {
      chewie = Chewie(
        controller: chewieController,
      );
    });
  }

  @override
  void initState() {
    super.initState();
    initializeVideoPlayer();
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyThemes.videogrey,
      body: Center(
        child: chewie ??
            Container(
              child: simpleLoading(),
            ),
      ),
    );
  }
}
