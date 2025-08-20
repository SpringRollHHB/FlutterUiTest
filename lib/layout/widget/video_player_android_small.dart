import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VideoPlayerAndroidSmall extends StatefulWidget {
  const VideoPlayerAndroidSmall({super.key});

  @override
  State<VideoPlayerAndroidSmall> createState() => _VideoPlayerAndroidSmallState();
}

class _VideoPlayerAndroidSmallState extends State<VideoPlayerAndroidSmall> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      alignment: Alignment.center,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.all(Radius.circular(15))
      ),
      child: const AndroidView(
        viewType: "native-video-view-small",
        layoutDirection: TextDirection.ltr,
        creationParams: <String, dynamic>{
          "url": "https://file.picku.cloud/40b977df/banner/ff01a42e9e59c244e824e4754a7f7d10.mp4", // 传递视频地址
        },
        creationParamsCodec: StandardMessageCodec(),
      ),
    );
  }
}
