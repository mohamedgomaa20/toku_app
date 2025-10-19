import 'package:flutter/material.dart';

import '../models/item_model.dart';
import '../widgets/build_item.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/info_card.dart';

class FamilyMembersScreen extends StatelessWidget {
  const FamilyMembersScreen({super.key});

  final List<Item> familyMembers = const [
    Item(
      imagePath: 'assets/images/family_members/family_father.png',
      sound: 'father.wav',
      jpName: 'Chichioya',
      enName: 'father',
    ),
    Item(
      imagePath: 'assets/images/family_members/family_mother.png',
      sound: 'mother.wav',
      jpName: 'Hahaoya',
      enName: 'mother',
    ),
    Item(
      imagePath: 'assets/images/family_members/family_grandfather.png',
      sound: 'grand father.wav',
      jpName: 'Ojīsan',
      enName: 'grand father',
    ),
    Item(
      imagePath: 'assets/images/family_members/family_grandmother.png',
      sound: 'grand mother.wav',
      jpName: 'Sobo',
      enName: 'grand mother',
    ),
    Item(
      imagePath: 'assets/images/family_members/family_son.png',
      sound: 'son.wav',
      jpName: 'Musuko',
      enName: 'son',
    ),
    Item(
      imagePath: 'assets/images/family_members/family_daughter.png',
      sound: 'daughter.wav',
      jpName: 'Musume',
      enName: 'daughter',
    ),
    Item(
      imagePath: 'assets/images/family_members/family_older_brother.png',
      sound: 'older bother.wav',
      jpName: 'Nīsan',
      enName: 'older brother',
    ),
    Item(
      imagePath: 'assets/images/family_members/family_older_sister.png',
      sound: 'older sister.wav',
      jpName: 'Ane',
      enName: 'older sister',
    ),
    Item(
      imagePath: 'assets/images/family_members/family_younger_brother.png',
      sound: 'younger brohter.wav',
      jpName: 'Otōto',
      enName: 'younger brother',
    ),
    Item(
      imagePath: 'assets/images/family_members/family_younger_sister.png',
      sound: 'younger sister.wav',
      jpName: 'Imōto',
      enName: 'younger sister',
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
              CustomAppBar(
                title: "Family Members",
                color: Color(0xff578a36),
                icon: Icons.family_restroom,
                lengthOfList: familyMembers.length,
              ),
              InfoCard(color: Color(0xff578a36)),
              Expanded(
                child: ListView.builder(
                  itemCount: familyMembers.length,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  itemBuilder: (context, index) => BuildItem(
                    item: familyMembers[index],
                    itemType: "family_members",
                    colorOne: Color(0xff578a36),
                    colorTwo: Color(0xff6ba045),
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
