import 'package:flutter/material.dart';
import 'package:panasonic_hybrid/utils/styles.dart';
import 'package:panasonic_hybrid/views/stain_genius/stain_genius_categories_screen.dart';

class Appbar extends StatelessWidget {
  const Appbar({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final StainGeniusCategories widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
     Row(
       children: [   IconButton(
          icon: const Icon(
            Icons.arrow_back,
            size: 20,
          ),
          color: Colors.black,
          onPressed: () {},
        ),
        Text(widget.title,style:ThemeText.commonHeader,),],
     ),
         IconButton(
          icon: const Icon(
            Icons.more_vert,
            size: 20,
          ),
          color: Colors.black,
          onPressed: () {},
        ),
      ],
    );
  }
}