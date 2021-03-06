// ignore_for_file: unused_field, prefer_final_fields, unused_element, unnecessary_const

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mgl_app/data/database.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:mgl_app/data/globals.dart' as globals;

class YoutubeVideo extends StatefulWidget {
  const YoutubeVideo({Key? key}) : super(key: key);

  @override
  _YoutubeVideoState createState() => _YoutubeVideoState();
}

class _YoutubeVideoState extends State<YoutubeVideo> {
  late YoutubePlayerController _controller;
  late TextEditingController _idController;
  late TextEditingController _seekToController;

  late PlayerState _playerState;
  late YoutubeMetaData _videoMetaData;
  double _volume = 100;
  bool _muted = false;
  bool _isPlayerReady = false;

  // final List<String> _ids = [
  //   'VlOHUOFEA3c',
  // ];

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: globals.video_key,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    )..addListener(listener);
    _idController = TextEditingController();
    _seekToController = TextEditingController();
    _videoMetaData = const YoutubeMetaData();
    _playerState = PlayerState.unknown;
  }

  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {
        _playerState = _controller.value.playerState;
        _videoMetaData = _controller.metadata;
      });
    }
  }

  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    _idController.dispose();
    _seekToController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String formatedTime(int secTime) {
      String getParsedTime(String time) {
        if (time.length <= 1) return "0$time";
        return time;
      }

      int min = secTime ~/ 60;
      int sec = secTime % 60;

      String parsedTime =
          getParsedTime(min.toString()) + " : " + getParsedTime(sec.toString());

      return parsedTime;
    }

    return Scaffold(
      body: YoutubePlayerBuilder(
        onExitFullScreen: () {
          // The player forces portraitUp after exiting fullscreen. This overrides the behaviour.
          SystemChrome.setPreferredOrientations(DeviceOrientation.values);
        },
        player: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
          progressIndicatorColor: Colors.blueAccent,
          topActions: <Widget>[
            const SizedBox(width: 8.0),
            Expanded(
              child: Text(
                _controller.metadata.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
            IconButton(
              icon: const Icon(
                Icons.settings,
                color: Colors.white,
                size: 25.0,
              ),
              onPressed: () {
                // log('Settings Tapped!');
              },
            ),
          ],
          onReady: () {
            _isPlayerReady = true;
          },
          onEnded: (data) {
            showAlertDialog(context);
            // _controller
            //     .load(_ids[(_ids.indexOf(data.videoId) + 1) % _ids.length]);
            // _showSnackBar('Next Video Started!');
          },
        ),
        builder: (context, player) => Scaffold(
          appBar: AppBar(
            title: const Text(
              '????????????',
              style: TextStyle(color: Colors.black),
            ),
            // ignore: prefer_const_literals_to_create_immutables
            actions: [],
          ),
          body: ListView(
            children: [
              player,
              for (var i = 0; i < globals.lessons.length; i++)
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromRGBO(229, 229, 229, 0.5),
                  ),
                  padding: const EdgeInsets.all(20),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 6.0),
                  height: 80,
                  child: Row(
                    children: [
                      Text(
                        '${globals.lessons[i].number}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 8.0),
                      Container(
                          height: 45,
                          width: 45,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          // child: SvgPicture.asset(
                          //   'assets/svgs/circle-play-solid 8.svg',
                          // ),
                          child: (globals.lessons[i].started)
                              ? SvgPicture.asset(
                                  'assets/svgs/circle-play-solid 8.svg')
                              : SvgPicture.asset(
                                  'assets/svgs/circle-play-solid 2.svg')),
                      const SizedBox(width: 8.0),
                      Expanded(
                        child: Row(
                          children: [
                            Container(
                              width: 205,
                              child: Text(
                                '${globals.lessons[i].name}',
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontFamily: 'Nunito',
                                  fontSize: 15.0,
                                ),
                              ),
                            ),
                            Container(
                                margin: const EdgeInsets.only(left: 8.0),
                                height: 80.0,
                                width: 40.0,
                                child: Center(
                                    child: Text(
                                  '${formatedTime(globals.lessons[i].time)}',
                                  style: const TextStyle(
                                    fontFamily: 'Nunito',
                                    fontSize: 12.0,
                                  ),
                                ))),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _loadCueButton(String action) {
    return Expanded(
      child: MaterialButton(
        color: Colors.blueAccent,
        onPressed: _isPlayerReady
            ? () {
                if (_idController.text.isNotEmpty) {
                  var id = YoutubePlayer.convertUrlToId(
                        _idController.text,
                      ) ??
                      '';
                  if (action == 'LOAD') _controller.load(id);
                  if (action == 'CUE') _controller.cue(id);
                  FocusScope.of(context).requestFocus(FocusNode());
                } else {
                  _showSnackBar('Source can\'t be empty!');
                }
              }
            : null,
        disabledColor: Colors.grey,
        disabledTextColor: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14.0),
          child: Text(
            action,
            style: const TextStyle(
              fontSize: 18.0,
              color: Colors.white,
              fontWeight: FontWeight.w300,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 16.0,
          ),
        ),
        backgroundColor: Colors.blueAccent,
        behavior: SnackBarBehavior.floating,
        elevation: 1.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
      ),
    );
  }
}

showAlertDialog(BuildContext context) {
  Widget okButton = TextButton(
    child: Text("????????????????"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  AlertDialog alert = AlertDialog(
    title: Text('???????????? ????????'),
    content: Text('???? ?????? ?????????????????? ???????????? ?????????? ???????? ?????'),
    actions: [
      okButton,
    ],
  );

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      });
}
