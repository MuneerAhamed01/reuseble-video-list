import 'dart:math';

import 'package:animation/better_player/player_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../reuseble_list/reuseable_list.dart';
import 'better_player_conroller.dart';
class VideoListData {
  final String videoTitle;
  final String videoUrl;
  Duration? lastPosition;
  bool? wasPlaying = false;

  VideoListData(this.videoTitle, this.videoUrl);
}




class ReusableVideoListPage extends StatelessWidget {
   ReusableVideoListPage({super.key});

 
 
final BetterPlayerGetController _controller = Get.put(BetterPlayerGetController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Reusable video list")),
      body: Container(
        color: Colors.grey,
        child: Column(children: [
          Expanded(
            child: NotificationListener<ScrollNotification>(
              onNotification: (notification) {
                final now = DateTime.now();
                final timeDiff = now.millisecondsSinceEpoch - _controller.lastMilli;
                if (notification is ScrollUpdateNotification) {
                  final pixelsPerMilli = notification.scrollDelta! / timeDiff;
                  if (pixelsPerMilli.abs() > 1) {
                    _controller.canBuildVideo = false;
                  } else {
                    _controller.canBuildVideo = true;
                  }
                  _controller.lastMilli = DateTime.now().millisecondsSinceEpoch;
                }

                if (notification is ScrollEndNotification) {
                  _controller.canBuildVideo = true;
                  _controller.lastMilli = DateTime.now().millisecondsSinceEpoch;
                }

                return true;
              },
              child: ListView.builder(
                itemCount: _controller.dataList.length,
                controller: _controller.scrollController,
                itemBuilder: (context, index) {
                  VideoListData videoListData = _controller.dataList[index];
                  return ReusableVideoListWidget(
                    videoListData: videoListData,
                    videoListController: _controller.videoListController,
                    canBuildVideo: _checkCanBuildVideo,
                  
                  );
                },
              ),
            ),
          )
        ]),
      ),
    );
  }

  bool _checkCanBuildVideo() {
    return _controller.canBuildVideo;
  }
}
