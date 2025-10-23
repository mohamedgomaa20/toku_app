import 'package:flutter/material.dart';
import 'package:toku_app/utils/app_colors.dart';

class WelcomeCard extends StatelessWidget {
  const WelcomeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.symmetric(horizontal: 20),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [
            AppColors.white.withOpacity(0.8),
            AppColors.white.withOpacity(0.6),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.08),
            blurRadius: 15,
            offset: Offset(0, 5),
          ),
        ],
      ),

      child: Row(
        children: [
          Icon(Icons.waving_hand, color: AppColors.aboutColorOne, size: 32),
          SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome back!",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkBrown,
                ),
              ),
              SizedBox(height: 4),
              Text(
                "Choose a category to start learning",
                style: TextStyle(
                  fontSize: 13,

                  color: AppColors.darkBrown.withOpacity(0.7),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
