import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:image_picker/image_picker.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:video_player/video_player.dart';

class MyVideoPlayer extends StatefulWidget {
  @override
  _MyVideoPlayerState createState() => _MyVideoPlayerState();
}

class _MyVideoPlayerState extends State<MyVideoPlayer> {
  Stopwatch watch = Stopwatch();
  late Timer timer;
  bool startStop = true;
  int? currentIndex;
  List<String> textArray = [
    "Hi! I'm Pavana",
    "Working in TaTa Elxsi",
    "Sydney, Australia."
  ];
  late File _video;
  String elapsedTime = '';
  ImagePicker picker = ImagePicker();
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    super.initState();
    initVideo();
  }

  initVideo() async {
    await _pickVideo().whenComplete(() {
      setState(() {});
    });
  }

  _pickVideo() async {
    PickedFile pickedFile = await picker.getVideo(source: ImageSource.gallery);
    _video = File(pickedFile.path);
    _videoPlayerController = VideoPlayerController.file(_video)
      ..initialize().then((_) {});
  }

  updateTime(Timer timer) {
    if (watch.isRunning) {
      setState(() {
        int index = (transformSecends(watch.elapsedMilliseconds) / 10).round();
        currentIndex = index % 3;
        elapsedTime = transformMilliSeconds(watch.elapsedMilliseconds);
        if (watch.elapsedMilliseconds ==
            _videoPlayerController.value.duration.inSeconds) {
          print("stop now");
          startOrStop();
        }
      });
    }
  }

  startOrStop() {
    if (startStop) {
      startWatch();
      _videoPlayerController.play();
    } else {
      stopWatch();
      _videoPlayerController.pause();
    }
  }

  startWatch() {
    setState(() {
      startStop = false;
      watch.start();
      timer = Timer.periodic(Duration(milliseconds: 100), updateTime);
    });
  }

  stopWatch() {
    setState(() {
      startStop = true;
      watch.stop();
      setTime();
    });
  }

  setTime() {
    var timeSoFar = watch.elapsedMilliseconds;
    setState(() {
      elapsedTime = transformMilliSeconds(timeSoFar);
    });
  }

  int transformSecends(int milliseconds) {
    int hundreds = (milliseconds / 10).truncate();
    int seconds = (hundreds / 100).truncate();
    return seconds;
  }

  transformMilliSeconds(int milliseconds) {
    int hundreds = (milliseconds / 10).truncate();
    int seconds = (hundreds / 100).truncate();
    int minutes = (seconds / 60).truncate();
    int hours = (minutes / 60).truncate();

    String hoursStr = (hours % 60).toString().padLeft(2, '0');
    String minutesStr = (minutes % 60).toString().padLeft(2, '0');
    String secondsStr = (seconds % 60).toString().padLeft(2, '0');

    return "$hoursStr:$minutesStr:$secondsStr";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              if (currentIndex != null)
                Text(textArray[currentIndex!],
                    style: TextStyle(fontSize: 25.0)),
              Text(elapsedTime, style: TextStyle(fontSize: 25.0)),
              SizedBox(height: 20.0),
              if (_video != null)
                _videoPlayerController.value.initialized
                    ? AspectRatio(
                        aspectRatio: _videoPlayerController.value.aspectRatio,
                        child: VideoPlayer(_videoPlayerController),
                      )
                    : Container(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FloatingActionButton(
                      heroTag: "btn1",
                      backgroundColor: Colors.red,
                      onPressed: () => startOrStop(),
                      child: Icon(
                          watch.isRunning ? Icons.pause : Icons.play_arrow)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
  // late File _video;
  // int index = 0;
  // List<String> arr = [
  //   "Hi! I'm Pavana",
  //   "Working in TaTa Elxsi",
  //   "Sydney, Australia."
  // ];
  // String subText = '';
  // Timer? timer;

  // ImagePicker picker = ImagePicker();

  // late VideoPlayerController _videoPlayerController;
  // @override
  // void initState() {
  //   super.initState();
  //   initVideo();
  // }

  // initVideo() async {
  //   await _pickVideo().whenComplete(() {
  //     setState(() {});
  //   });
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  //   _videoPlayerController.dispose();
  // }

  // _pickVideo() async {
  //   PickedFile pickedFile = await picker.getVideo(source: ImageSource.gallery);

  //   _video = File(pickedFile.path);

  //   _videoPlayerController = VideoPlayerController.file(_video)
  //     ..initialize().then((_) {
  //       setState(() {
  //         subText = arr[0];
  //       });
  //       _videoPlayerController.play().then((value) => {
  //             setTextFunction(),
  //           });
  //     });
  // }

  // int getRoundVal() {
  //   int val = _videoPlayerController.value.duration.inSeconds ~/ 10.round();
  //   return val;
  // }

  // setTextFunction() {
  //   timer = Timer.periodic(
  //       Duration(seconds: 10),
  //       (Timer t) => {
  //             index++,
  //             setState(() {
  //               subText = arr[index];
  //             }),
  //           });
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text("Video Picker"),
  //     ),
  //     body: SingleChildScrollView(
  //       child: Center(
  //         child: Column(
  //           children: [
  //             Container(
  //               padding: const EdgeInsets.all(16.0),
  //               child: Column(
  //                 children: <Widget>[
  //                   Text(subText),
  //                   Container(
  //                     child: FloatingActionButton(
  //                       onPressed: () {
  //                         setState(() {
  //                           if (_videoPlayerController.value.isPlaying) {
  //                             _videoPlayerController.pause();
  //                           } else {
  //                             _videoPlayerController.play();
  //                           }
  //                         });
  //                       },
  //                       child: Icon(
  //                         _videoPlayerController.value.isPlaying
  //                             ? Icons.pause
  //                             : Icons.play_arrow,
  //                       ),
  //                     ),
  //                   ),
  //                   if (_video != null)
  //                     _videoPlayerController.value.initialized
  //                         ? AspectRatio(
  //                             aspectRatio:
  //                                 _videoPlayerController.value.aspectRatio,
  //                             child: VideoPlayer(_videoPlayerController),
  //                           )
  //                         : Container()
  //                   else
  //                     Text(
  //                       "Click on Pick Video to select video",
  //                       style: TextStyle(fontSize: 18.0),
  //                     ),
  //                 ],
  //               ),
  //             ),
  //             ElevatedButton(
  //               onPressed: () {
  //                 _pickVideo();
  //               },
  //               child: Text("Pick Video From Gallery"),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
