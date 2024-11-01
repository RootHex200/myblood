import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.userName,  required this.userLocation});
  final String userName;
  final String userLocation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Hello, {$userName}"),
                IconButton(
                    onPressed: () {}, icon: const Icon(CupertinoIcons.bell))
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.circle_rounded,
                  color:
                      Colors.green, // todo: change color through active status,
                  size: 10,
                ),
                Text("user Location")
              ],
            )
          ],
        ),
      )),
    );
  }
}
