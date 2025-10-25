import 'package:flutter/material.dart';
import 'package:toku_app/widgets/build_phrases_item.dart';
import 'package:toku_app/widgets/info_card.dart';

import '../models/item_model.dart';
import '../utils/app_colors.dart';
import '../widgets/custom_app_bar.dart';

class PhrasesScreen extends StatelessWidget {
  const PhrasesScreen({super.key});

  final List<Item> phrases = const [
    Item(
      sound: 'what_is_your_name.wav',
      jpName: 'namae wa nandesuka',
      enName: 'what is your name?',
    ),
    Item(
      sound: 'where_are_you_going.wav',
      jpName: 'Doko ni iku no',
      enName: 'where are you going?',
    ),
    Item(
      sound: 'are_you_coming.wav',
      jpName: 'Kimasu ka',
      enName: 'are you coming?',
    ),
    Item(
      sound: 'yes_im_coming.wav',
      jpName: 'Hai, watashi wa kite imasu',
      enName: 'yes i\'m coming',
    ),
    Item(
      sound: 'how_are_you_feeling.wav',
      jpName: 'Go kibun wa ikagadesu ka',
      enName: 'how are you feeling?',
    ),
    Item(
      sound: 'i_love_anime.wav',
      jpName: 'Watashi wa anime ga daisukidesu',
      enName: 'i love anime',
    ),
    Item(
      sound: 'i_love_programming.wav',
      jpName: 'Watashi wa puroguramingu ga daisukidesu',
      enName: 'i love programming',
    ),
    Item(
      sound: 'programming_is_easy.wav',
      jpName: 'Puroguramingu wa kantandesu',
      enName: 'programming is easy',
    ),
    Item(
      sound: 'dont_forget_to_subscribe.wav',
      jpName: 'Kōdoku suru koto o wasurenaide kudasai',
      enName: 'don\'t forget to subscribe',
    ),
    Item(
      sound: 'i_love_anime.wav',
      jpName: 'Watashi wa anime ga daisukidesu',
      enName: 'i love anime',
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
              CustomAppBar(
                title: "Phrases",
                color: AppColors.phrasesColorOne,
                icon: Icons.chat_bubble,
                lengthOfList: phrases.length,
              ),
              const InfoCard(color: AppColors.phrasesColorOne),
              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: phrases.length,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemBuilder: (context, index) => BuildPhrasesItem(
                    item: phrases[index],
                    itemType: "phrases",
                    delay: (index * 60).clamp(0, 300),
                    colorOne: AppColors.phrasesColorOne,
                    colorTwo: AppColors.phrasesColorTwo,
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
