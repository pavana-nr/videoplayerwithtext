import 'package:flutter/material.dart';
import 'package:panasonic_hybrid/views/splash.dart';
import 'package:panasonic_hybrid/views/stain_genius/stain_genius_categories_screen.dart';
import 'package:panasonic_hybrid/views/video_player/my_video_player.dart';
import 'package:panasonic_hybrid/views/video_player/my_video_player_with_controls.dart';

class Routes {
  const Routes._();

  static const splash = '/';
  static const stain = '/stain';
  static const myvideo = '/myvideo';
  static const mycontrols = '/myvideo';

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    final name = settings.name;

    switch (name) {
      case splash:
        return MaterialPageRoute(
          builder: (context) {
            return SplashScreen();
          },
        );
      case stain:
        return MaterialPageRoute(
          builder: (context) {
            return StainGeniusCategories(title: "Stain Genius");
          },
        );
      case myvideo:
        return MaterialPageRoute(
          builder: (context) {
            return MyVideoPlayer();
          },
        );
      case mycontrols:
        return MaterialPageRoute(
          builder: (context) {
            return VideoPlayerWithControls();
          },
        );
    }
  }
}
