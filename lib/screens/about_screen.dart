import 'package:flutter/material.dart';
import 'package:toku_app/utils/app_colors.dart';
import 'package:toku_app/widgets/app_info_card.dart';
import 'package:toku_app/widgets/build_contact_card.dart';
import 'package:toku_app/widgets/custom_app_bar.dart';
import 'package:url_launcher/url_launcher.dart';

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

  Future<void> _launchUrl(url) async {
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: AppColors.backgroundGradientWidget),
        child: SafeArea(
          child: Column(
            children: [
              const CustomAppBar(
                icon: Icons.person,
                title: "About Developer",
                color: AppColors.aboutColorOne,
              ),

              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      ProfileImageSection(userDeveloper: userDeveloper),
                      const SizedBox(height: 25),
                      NameAndJobTitleSection(userDeveloper: userDeveloper),

                      const SizedBox(height: 30),
                      BuildContactCard(
                        hasArrow: false,
                        icon: Icons.info_outline,
                        title: "About Me",
                        subtitle: userDeveloper.bio,
                        onTap: () {},
                      ),

                      const SizedBox(height: 15),
                      BuildContactCard(
                        icon: Icons.email,
                        title: "Email",
                        subtitle: userDeveloper.email,
                        onTap: () {
                          _launchUrl("mailto:${userDeveloper.email}");
                        },
                      ),
                      const SizedBox(height: 15),
                      BuildContactCard(
                        icon: Icons.phone,
                        title: "Phone",
                        subtitle: userDeveloper.phone,
                        onTap: () {
                          _launchUrl("tel:${userDeveloper.phone}");
                        },
                      ),
                      const SizedBox(height: 30),

                      ConnectWithMeSection(
                        onTapGithub: () {
                          _launchUrl("https://github.com/mohamedgomaa20");
                        },
                        onTapLinkedIn: () {
                          _launchUrl(
                            "https://www.linkedin.com/in/mohamed-gomaa-874133284",
                          );
                        },
                        onTapWebsite: () {
                          _launchUrl(
                            "https://www.facebook.com/Mohamed.Gomaa.Nagy",
                          );
                        },
                      ),

                      const SizedBox(height: 30),
                      AppInfoCard(
                        onTap: () {
                          _launchUrl(
                            "https://github.com/mohamedgomaa20/toku_app",
                          );
                        },
                        appIcon: Icons.school,
                        appName: "Toku App",
                        appDescription: "Learn Japanese Language",
                        appVersion: "1.0.0",
                      ),
                      const SizedBox(height: 30),
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
