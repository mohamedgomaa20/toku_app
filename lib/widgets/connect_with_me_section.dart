import 'package:flutter/material.dart';

import 'build_social_button.dart';

class ConnectWithMeSection extends StatelessWidget {
  const ConnectWithMeSection({
    super.key,
    required this.onGithub,
    required this.onLinkedIn,
    required this.onWebsite,
  });

  final VoidCallback onGithub;
  final VoidCallback onLinkedIn;
  final VoidCallback onWebsite;

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
              color: Color(0xff48302c),
            ),
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BuildSocialButton(
                color: Color(0xff333333),
                icon: Icons.code,
                onTap: () {},
              ),
              SizedBox(width: 15),
              BuildSocialButton(
                color: Color(0xff0077b5),
                icon: Icons.work,
                onTap: () {},
              ),
              SizedBox(width: 15),
              BuildSocialButton(
                color: Color(0xfff09137),
                icon: Icons.language,
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
