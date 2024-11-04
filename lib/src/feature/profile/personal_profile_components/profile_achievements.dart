import 'package:flutter/material.dart';
import 'package:myblood/src/constants/achiviements_list.dart';

class ProfileAchievements extends StatelessWidget {
  const ProfileAchievements({super.key, required this.index});
  final int index;
  final achievements = profileAchievement;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: SizedBox(
        height: 100,
        width: 100,
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1.2,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.amber,
                    image: DecorationImage(
                        image: NetworkImage(profileAchievement[index]["image"]),
                        fit: BoxFit.fill)),
              ),
            ),
            Text(
              achievements[index]["achivement"],
              style: const TextStyle(
                  fontSize: 17, fontWeight: FontWeight.bold, color: Colors.red),
            )
          ],
        ),
      ),
    );
  }
}
