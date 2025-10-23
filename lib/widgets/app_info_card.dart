import 'package:flutter/material.dart';

class AppInfoCard extends StatelessWidget {
  const AppInfoCard({
    super.key,
    required this.appIcon,
    required this.appName,
    required this.appDescription,
    required this.appVersion,
  });

  final IconData appIcon;
  final String appName;
  final String appDescription;
  final String appVersion;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: Duration(seconds: 2),
      tween: Tween<double>(begin: 0, end: 1),
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(50 * (1 - value), 0),
          child: Opacity(opacity: value, child: child),
        );
      },
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [
              Colors.white.withOpacity(0.7),
              Colors.white.withOpacity(0.5),
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.05),
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),

        child: Column(
          children: [
            Icon(appIcon, size: 40, color: Color(0xff48302c)),
            SizedBox(height: 10),
            Text(
              appName,
              style: TextStyle(
                fontSize: 22,
                color: Color(0xff48302c),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              appDescription,
              style: TextStyle(
                fontSize: 14,
                color: Color(0xff48302c).withOpacity(.7),
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Version $appVersion",
              style: TextStyle(
                fontSize: 12,
                color: Color(0xff48302c).withOpacity(.5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
