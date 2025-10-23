import 'package:flutter/material.dart';
import 'package:toku_app/screens/color_screen.dart';
import 'package:toku_app/screens/family_member_screen.dart';
import 'package:toku_app/screens/numbers_screen.dart';
import 'package:toku_app/screens/phrases_screen.dart';

import '../models/category_model.dart';
import '../widgets/build_category_item.dart';
import '../widgets/toku_header.dart';
import '../widgets/welcome_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<CategoryModel> categories = const [
    CategoryModel(
      title: "Numbers",
      subtitle: "Learn counting in German",
      color: Color(0xfff09137),
      icon: Icons.looks_one,
      widget: NumbersScreen(),
    ),
    CategoryModel(
      title: "Family Members",
      subtitle: "Learn family vocabulary",
      color: Color(0xff578a36),
      icon: Icons.family_restroom,
      widget: FamilyMembersScreen(),
    ),
    CategoryModel(
      title: "Colors",
      subtitle: "Learn color names",
      color: Color(0xff79329f),
      icon: Icons.palette,
      widget: ColorsScreen(),
    ),
    CategoryModel(
      title: "Phrases",
      subtitle: "Learn common phrases",
      color: Color(0xff50acc9),
      icon: Icons.chat_bubble,
      widget: PhrasesScreen(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xfffff4db), Color(0xfffef5e0), Color(0xfffdf6e3)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              TokuHeader(),
              SizedBox(height: 20),
              WelcomeCard(),
              SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Categories",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff48302c),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Expanded(
                child: ListView.separated(
                  itemCount: categories.length,
                  separatorBuilder: (context, index) => SizedBox(height: 15),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  itemBuilder: (context, index) => BuildCategoryItem(
                    categoryModel: categories[index],
                    delay: index * 80,
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
