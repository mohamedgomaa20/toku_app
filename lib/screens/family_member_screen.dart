import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/number_model.dart';
import '../widgets/build_item.dart';

class FamilyMemberScreen extends StatelessWidget {
  const FamilyMemberScreen({super.key});

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
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xff48302c), Color(0xff5d3c37)],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.2),
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white.withOpacity(.2),
                        ),
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                    SizedBox(width: 15),
                    Icon(
                      Icons.family_restroom,
                      color: Color(0xff578a36),
                      size: 28,
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Family Members",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 6,
                        horizontal: 12,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xff578a36).withOpacity(.3),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Color(0xff578a36).withOpacity(.5),
                          width: 1.5,
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.list, color: Colors.white, size: 16),
                          SizedBox(width: 5),
                          Text(
                            "${familyMembers.length}",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(16),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: LinearGradient(
                    colors: [
                      Colors.white.withOpacity(.7),
                      Colors.white.withOpacity(.5),
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
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Color(0xff578a36).withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        CupertinoIcons.info,
                        color: Color(0xff578a36),
                        size: 24,
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        "Tap the play button to hear pronunciation",
                        style: TextStyle(
                          color: Color(0xff48302c),
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
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
