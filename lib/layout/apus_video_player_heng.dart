import 'package:flutter/material.dart';
import 'package:flutteruitest/layout/smallWidget/smooth_progress_two.dart';
import 'package:video_player/video_player.dart';

class ApusVideoPlayerH extends StatefulWidget {
  const ApusVideoPlayerH({super.key});

  @override
  State<ApusVideoPlayerH> createState() => _ApusVideoPlayerHState();
}

class _ApusVideoPlayerHState extends State<ApusVideoPlayerH> with SingleTickerProviderStateMixin {

  late VideoPlayerController _videoPlayerController;

  final ValueNotifier<double> _XX = ValueNotifier(0.0);

  final ValueNotifier<bool> _isPlaying = ValueNotifier(true);


  @override
  void initState() {
    super.initState();

    _videoPlayerController = VideoPlayerController.asset("videos/letmedownslowly.mp4",)
      ..addListener(() {
        double newProgress = _videoPlayerController.value.position.inMilliseconds / _videoPlayerController.value.duration.inMilliseconds;
        _XX.value = newProgress;
        if(_videoPlayerController.value.isPlaying) {
          _isPlaying.value = true;
        }
      })
      ..setLooping(true)
      ..initialize().then((value) {
        //加载完成
        _videoPlayerController.play();
        setState(() {

        });
      });

  }

  @override
  void dispose() {
    super.dispose();
    _videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Stack(
          children: [
            Positioned.fill(
              left: 0,
              right: 0,
              child: Column(
                children: [
                  const Spacer(),
                  Container(
                    color: Colors.red,
                    width: double.infinity,
                    child: _videoPlayerController.value.isInitialized
                        ? AspectRatio(
                            aspectRatio:
                                _videoPlayerController.value.aspectRatio,
                            child: Stack(alignment: Alignment.center,children: [
                              VideoPlayer(_videoPlayerController),
                              ValueListenableBuilder(
                                  valueListenable: _isPlaying,
                                  builder: (
                                    BuildContext context,
                                    bool value,
                                    Widget? child,
                                  ) {
                                    return Visibility(
                                      visible: !value,
                                      child: GestureDetector(
                                        onTap: () {
                                          _videoPlayerController.play();
                                        },
                                        child: Container(
                                          height: 48,
                                          width: 48,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: const Color(0xFF111E08)
                                                .withOpacity(0.7),
                                            borderRadius:
                                                BorderRadius.circular(24),
                                          ),
                                          child: Image.asset(
                                            "images/video_start_playing.webp",
                                            height: 24,
                                            width: 24,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],),
                          )
                        : Container(),
                  ),
                  if (_videoPlayerController.value.isInitialized)
                    ValueListenableBuilder(
                      valueListenable: _XX,
                      builder:
                          (BuildContext context, double value, Widget? child) {
                        return SmoothProgressTwo(
                          progress: value,
                        );
                      },
                    ),
                  const Spacer(),
                ],
              ),
            ),
            Positioned(
              left: MediaQuery.of(context).size.width / 2 - 24,
              bottom: 33,
              child: ValueListenableBuilder(
                valueListenable: _isPlaying,
                builder: (BuildContext context, bool value, Widget? child) {
                  return Visibility(
                    visible: value,
                    child: GestureDetector(
                      onTap: () {
                        _videoPlayerController.pause();
                        _isPlaying.value = false;
                      },
                      child: Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                            color: const Color(0xFFFFFFFF).withOpacity(0.3),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(24))),
                        alignment: Alignment.center,
                        child: Image.asset(
                          "images/video_player_stop.webp",
                          height: 24,
                          width: 24,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Positioned(
              left: 14,
              top: MediaQuery.of(context).padding.top + 8,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      color: const Color(0xFF363636).withOpacity(0.4),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20))),
                  alignment: Alignment.center,
                  child: Image.asset(
                    "images/video_back.webp",
                    height: 24,
                    width: 24,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
