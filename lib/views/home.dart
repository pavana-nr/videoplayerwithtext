import 'package:flutter/material.dart';
import 'package:panasonic_hybrid/utils/routes.dart';

class Home extends StatelessWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome Pavana'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Hello World'),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.myvideo);
              },
              child: Text("Watch Video"),
            ),
          ],
        ),
      ),
    );
  }
}
