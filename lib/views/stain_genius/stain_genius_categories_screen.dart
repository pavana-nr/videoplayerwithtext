import 'package:flutter/material.dart';
import 'package:panasonic_hybrid/utils/routes.dart';
import 'package:panasonic_hybrid/utils/styles.dart';
import 'package:panasonic_hybrid/views/common_widgets/appbar.dart';
import 'package:panasonic_hybrid/views/common_widgets/stain_widget.dart';


class StainGeniusCategories extends StatefulWidget {
  StainGeniusCategories({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _StainGeniusCategoriesState createState() => _StainGeniusCategoriesState();
}

class _StainGeniusCategoriesState extends State<StainGeniusCategories> {
  

  @override
  Widget build(BuildContext context) {
   
    return MaterialApp(
      home: SafeArea(
      
        child: Scaffold(
          backgroundColor: Color(0XFFf2f2f2),
          appBar: PreferredSize(
            preferredSize:const Size.fromHeight(57.0),
            child: Appbar(widget: widget),
          ),
          body: 
          Container(
            margin: const EdgeInsets.all(10.0),
            child: Wrap(
              direction: Axis.horizontal,
  children: [
    StainWidget(),
    StainWidget(),
    StainWidget(),
    StainWidget(),
    StainWidget(),
     StainWidget(),
    StainWidget(),
    StainWidget(),
    StainWidget(),
    StainWidget(),
    StainWidget()
  ],
),
          ),

          // Center(
          //   child: Container(child: Column(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     crossAxisAlignment: CrossAxisAlignment.center,
          //     children: [
          //       Text("Stain Genius",style: ThemeText.commonBody,),
          //       ElevatedButton(onPressed: 
          //         () {
          //           Navigator.pushNamed(context,
          //             Routes.splash
          //           );
          //         },
          //         child: Text("Go back"))
          //     ],
          //   ),),
          // )
          ),
      ));
  }
}

