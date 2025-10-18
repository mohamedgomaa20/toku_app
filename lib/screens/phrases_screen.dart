import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toku_app/widgets/build_phrases_item.dart';

import '../models/phrases_model.dart';

class PhrasesScreen extends StatelessWidget {
  const PhrasesScreen({super.key});

  final List<Phrases> phrases = const [
    Phrases(
      sound: 'what_is_your_name.wav',
      jpName: 'namae wa nandesuka',
      enName: 'what is your name',
    ),
    Phrases(
      sound: 'where_are_you_going.wav',
      jpName: 'Doko ni iku no',
      enName: 'where are you going',
    ),
    Phrases(
      sound: 'are_you_coming.wav',
      jpName: 'Kimasu ka',
      enName: 'are you coming',
    ),
    Phrases(
      sound: 'yes_im_coming.wav',
      jpName: 'Hai, watashi wa kite imasu',
      enName: 'yes i\'m coming',
    ),
    Phrases(
      sound: 'how_are_you_feeling.wav',
      jpName: 'Go kibun wa ikagadesu ka',
      enName: 'how are you feeling',
    ),
    Phrases(
      sound: 'i_love_anime.wav',
      jpName: 'Watashi wa anime ga daisukidesu',
      enName: 'i love anime',
    ),
    Phrases(
      sound: 'i_love_programming.wav',
      jpName: 'Watashi wa puroguramingu ga daisukidesu',
      enName: 'i love programming',
    ),
    Phrases(
      sound: 'programming_is_easy.wav',
      jpName: 'Puroguramingu wa kantandesu',
      enName: 'programming is easy',
    ),
    Phrases(
      sound: 'dont_forget_to_subscribe.wav',
      jpName: 'Kōdoku suru koto o wasurenaide kudasai',
      enName: 'don\'t forget to subscribe',
    ),
    Phrases(
      sound: 'i_love_anime.wav',
      jpName: 'Watashi wa anime ga daisukidesu',
      enName: 'i love anime',
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
                    Icon(Icons.chat_bubble, color: Color(0xff50acc9), size: 28),
                    SizedBox(width: 10),
                    Text(
                      "Phrases",
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
                        color: Color(0xff50acc9).withOpacity(.3),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Color(0xff50acc9).withOpacity(.5),
                          width: 1.5,
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.list, color: Colors.white, size: 16),
                          SizedBox(width: 5),
                          Text(
                            "${phrases.length}",
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
                        color: Color(0xff50acc9).withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        CupertinoIcons.info,
                        color: Color(0xff50acc9),
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
                  itemCount: phrases.length,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  itemBuilder: (context, index) => BuildPhrasesItem(
                    item: phrases[index],
                    itemType: "phrases",
                    colorOne: Color(0xff50acc9),
                    colorTwo: Color(0xff65bcd4),
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
