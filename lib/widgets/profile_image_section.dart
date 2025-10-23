import 'package:flutter/material.dart';

import '../models/user_model.dart';

class ProfileImageSection extends StatelessWidget {
  const ProfileImageSection({super.key, required this.userDeveloper});

  final User userDeveloper;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: Duration(milliseconds: 800),
      tween: Tween<double>(begin: 0, end: 1),
      builder: (context, value, child) {
        return Transform.scale(scale: value, child: child);
      },
      child: Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(userDeveloper.image),
          ),
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [Color(0xff48302c), Color(0xff5d3c37)],
          ),
          boxShadow: [
            BoxShadow(
              color: Color(0xff48302c).withOpacity(.4),
              blurRadius: 10,
              offset: Offset(0, 10),
            ),
          ],
        ),
      ),
    );
  }
}
