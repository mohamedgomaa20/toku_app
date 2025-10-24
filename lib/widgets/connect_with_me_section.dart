import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:toku_app/utils/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

import 'build_social_button.dart';

class ConnectWithMeSection extends StatelessWidget {
  ConnectWithMeSection({
    super.key,
    required this.onTapGithub,
    required this.onTapLinkedIn,
    required this.onTapWebsite,
  });

  final VoidCallback onTapGithub;
  final VoidCallback onTapLinkedIn;
  final VoidCallback onTapWebsite;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: 1),
      duration: Duration(milliseconds: 1800),
      builder: (context, value, child) {
        return Opacity(opacity: value, child: child);
      },
      child: Column(
        children: [
          Text(
            "Connect With Me",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.darkBrown,
            ),
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BuildSocialButton(
                color: AppColors.darkGray,
                icon: Icons.code,
                onTap: onTapGithub,
              ),
              SizedBox(width: 15),
              BuildSocialButton(
                color: AppColors.primaryBlue,
                icon: Ionicons.logo_linkedin,
                onTap: onTapLinkedIn,
              ),
              SizedBox(width: 15),
              BuildSocialButton(
                color: AppColors.aboutColorOne,
                icon: Icons.language,
                onTap: onTapWebsite,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
