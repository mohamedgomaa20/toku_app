import 'package:flutter/material.dart';
import 'package:toku_app/utils/app_colors.dart';

import '../models/user_model.dart';

class ProfileImageSection extends StatelessWidget {
  const ProfileImageSection({super.key, required this.userDeveloper});

  final User userDeveloper;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: const Duration(milliseconds: 800),
      tween: Tween<double>(begin: 0, end: 1),
      builder: (context, value, child) {
        return Transform.scale(
          scale: value,
          child: Opacity(opacity: value, child: child),
        );
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
          boxShadow: [
            BoxShadow(
              color: AppColors.darkBrown.withOpacity(.4),
              blurRadius: 10,
              offset: const Offset(0, 10),
            ),
          ],
        ),
      ),
    );
  }
}
