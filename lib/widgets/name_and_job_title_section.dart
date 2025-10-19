import 'package:flutter/material.dart';

import '../models/user_model.dart';

class NameAndJobTitleSection extends StatelessWidget {
  const NameAndJobTitleSection({super.key, required this.userDeveloper});

  final User userDeveloper;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          userDeveloper.developerName,
          style: TextStyle(
            color: Color(0xff48302c),
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        Container(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: [Color(0xfff09137), Color(0xfff5a855)],
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.orange.withOpacity(.3),
                blurRadius: 10,
                offset: Offset(0, 5),
              ),
            ],
          ),

          child: Text(
            userDeveloper.joTitle,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
