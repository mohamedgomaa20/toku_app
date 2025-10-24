import 'package:flutter/material.dart';
import 'package:toku_app/screens/color_screen.dart';
import 'package:toku_app/screens/family_member_screen.dart';
import 'package:toku_app/screens/numbers_screen.dart';
import 'package:toku_app/screens/phrases_screen.dart';
import 'package:toku_app/utils/app_colors.dart';

import '../models/category_model.dart';
import '../widgets/build_category_item.dart';
import '../widgets/toku_header.dart';
import '../widgets/welcome_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<CategoryModel> categories = const [
    CategoryModel(
      title: "Numbers",
      subtitle: "Learn counting in Japanese",
      color: AppColors.numbersColorOne,
      icon: Icons.looks_one,
      widget: NumbersScreen(),
    ),
    CategoryModel(
      title: "Family Members",
      subtitle: "Learn family vocabulary",
      color: AppColors.familyColorOne,
      icon: Icons.family_restroom,
      widget: FamilyMembersScreen(),
    ),
    CategoryModel(
      title: "Colors",
      subtitle: "Learn color names",
      color: AppColors.colorsColorOne,
      icon: Icons.palette,
      widget: ColorsScreen(),
    ),
    CategoryModel(
      title: "Phrases",
      subtitle: "Learn common phrases",
      color: AppColors.phrasesColorOne,
      icon: Icons.chat_bubble,
      widget: PhrasesScreen(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: AppColors.backgroundGradientWidget),
        child: SafeArea(
          child: Column(
            children: [
              const TokuHeader(),
              const SizedBox(height: 20),
              const WelcomeCard(),
              const SizedBox(height: 25),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Categories",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: AppColors.darkBrown,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Expanded(
                child: ListView.separated(
                  itemCount: categories.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 15),
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    bottom: 20,
                  ),
                  itemBuilder: (context, index) => BuildCategoryItem(
                    categoryModel: categories[index],
                    delay: index * 150,
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
