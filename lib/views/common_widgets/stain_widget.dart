

import 'package:flutter/material.dart';
import 'package:panasonic_hybrid/utils/styles.dart';

class StainWidget extends StatelessWidget {
  const StainWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
       decoration: new BoxDecoration(
    borderRadius: new BorderRadius.circular(8.0),
    color: Colors.white,
  ),
        margin: const EdgeInsets.all(14.0),
        padding: const EdgeInsets.all(14.0),
      child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/profile.jpg',width: 40,height: 40,),
              Padding(
                padding: const EdgeInsets.only(top:20.0),
                child: Text('Stain Name',style: ThemeText.stainName,),
              ),
            ],
      ),
    );
  }
}