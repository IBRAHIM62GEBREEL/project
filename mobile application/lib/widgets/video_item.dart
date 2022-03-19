import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class VideoItem extends StatefulWidget {
  final int index;
  final String text;
  final String videoUrl;
  final String imgUrl;

  const VideoItem(
      {Key? key,
      required this.index,
      required this.imgUrl,
      required this.text,
      required this.videoUrl})
      : super(key: key);

  @override
  State<VideoItem> createState() => _VideoItemState();
}

class _VideoItemState extends State<VideoItem> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();

    print('${widget.videoUrl} hwa dh el url');
    try {
      _controller = YoutubePlayerController(
        initialVideoId:
            YoutubePlayerController.convertUrlToId(widget.videoUrl)!,
        params: const YoutubePlayerParams(
            loop: true,
            color: 'transparent',
            desktopMode: true,
            strictRelatedVideos: true,
            showFullscreenButton: !kIsWeb),
      );
      print('${widget.videoUrl} kda dh error mn t7t');
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    print('screen built ');
    print('${widget.videoUrl}   deh ta7t elscreeen built');
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: kIsWeb
                ? MediaQuery.of(context).size.height / 1.13
                : MediaQuery.of(context).size.height * 0.5,
            child: widget.videoUrl.isEmpty
                ? const Center(
                    child: Text('No Video'),
                  )
                : YoutubePlayerControllerProvider(
                    controller: _controller,
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15)),
                        child: YoutubePlayerIFrame(controller: _controller)),
                  ),
          ),
          const SizedBox(
            height: 20,
          ),
          const SizedBox(
            width: double.infinity,
            child: Text(
              'التفاصيل',
              textAlign: TextAlign.end,
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            child: Text(
              utf8.decode(widget.text.runes.toList()),
              textDirection: TextDirection.rtl,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.08,
              child: const Center(
                child: Text(
                  'Back',
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              ),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color(0xff6ee2f5),
                    Color(0xff6454f0),
                  ],
                ),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          )
        ],
      ),
    );
  }
}
