import 'package:flutter/material.dart';
import 'package:toku_app/widgets/app_info_card.dart';
import 'package:toku_app/widgets/build_contact_card.dart';
import 'package:toku_app/widgets/custom_app_bar.dart';
import 'package:toku_app/utils/app_colors.dart';
import '../models/user_model.dart';
import '../widgets/connect_with_me_section.dart';
import '../widgets/name_and_job_title_section.dart';
import '../widgets/profile_image_section.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  final userDeveloper = const User(
    image: "assets/mohamed_gomaa.jpg",
    developerName: "Mohamed Gomaa",
    joTitle: "Flutter Developer",
    bio:
        "Passionate mobile app developer specialized in creating beautiful and functional applications using Flutter.",
    email: "20monagy@gmail.com",
    phone: "+20 1002418816",
    github: "https://github.com/mohamedgomaa20",
    linkedin: "https://www.linkedin.com/in/mohamed-gomaa-874133284",
    website: "https://mohamedgomaa.dev",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: AppColors.backgroundGradientWidget),
        child: SafeArea(
          child: Column(
            children: [
              CustomAppBar(
                icon: Icons.person,
                title: "About Developer",
                color: AppColors.aboutColorOne,
              ),

              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      ProfileImageSection(userDeveloper: userDeveloper),
                      SizedBox(height: 25),
                      NameAndJobTitleSection(userDeveloper: userDeveloper),

                      SizedBox(height: 30),
                      BuildContactCard(
                        hasArrow: false,
                        icon: Icons.info_outline,
                        title: "About Me",
                        subtitle: userDeveloper.bio,
                        onTap: () {},
                      ),

                      SizedBox(height: 15),
                      BuildContactCard(
                        icon: Icons.email,
                        title: "Email",
                        subtitle: userDeveloper.email,
                        onTap: () {},
                      ),
                      SizedBox(height: 15),
                      BuildContactCard(
                        icon: Icons.phone,
                        title: "Phone",
                        subtitle: userDeveloper.phone,
                        onTap: () {},
                      ),
                      SizedBox(height: 30),

                      ConnectWithMeSection(
                        onGithub: () {},
                        onLinkedIn: () {},
                        onWebsite: () {},
                      ),

                      SizedBox(height: 30),
                      AppInfoCard(
                        appIcon: Icons.school,
                        appName: "Toku App",
                        appDescription: "Learn Japanese Language",
                        appVersion: "1.0.0",
                      ),
                      SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
