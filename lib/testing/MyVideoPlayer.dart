import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../Themes.dart';


class MyVideoPlayer extends StatefulWidget {
  String url;

  MyVideoPlayer(this.url);

  @override
  _MyVideoPlayerState createState() => _MyVideoPlayerState();
}

class _MyVideoPlayerState extends State<MyVideoPlayer> {

  TargetPlatform _platform;
  YoutubePlayerController  _videoPlayerController1;


  @override
  void initState() {
    super.initState();
    this.initializePlayer();
  }

  @override
  void dispose() {
    _videoPlayerController1.dispose();
    super.dispose();
  }

  Future<void> initializePlayer() async {
    _videoPlayerController1 = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.url),
      // flags: YoutubePLayerFlags(
      //   isLive: true,
      // ),
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: BLACK,
      body:  Container(
            child: YoutubePlayer(
              controller: _videoPlayerController1,
              liveUIColor: Colors.amber,
            )
          )
    );
  }
}
