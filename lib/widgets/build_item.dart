import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import '../models/item_model.dart';

class BuildItem extends StatefulWidget {
  const BuildItem({
    super.key,
    required this.item,
    required this.colorOne,
    required this.colorTwo,
    required this.itemType,
  });

  final Item item;
  final Color colorOne;
  final Color colorTwo;
  final String itemType;

  @override
  State<BuildItem> createState() => _BuildItemState();
}

class _BuildItemState extends State<BuildItem> {
  bool isPlaying = false;
  AudioPlayer? audioPlayer;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void dispose() {
    audioPlayer?.stop();
    audioPlayer?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomRight,
          colors: [widget.colorOne, widget.colorTwo],
        ),
        boxShadow: [
          BoxShadow(
            color: widget.colorOne.withOpacity(0.3),
            blurRadius: 12,
            offset: Offset(0, 6),
          ),
        ],
      ),

      child: Stack(
        children: [
          Positioned(
            right: -20,
            top: -20,
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(.1),
              ),
            ),
          ),
          Positioned(
            right: 30,
            bottom: -30,
            child: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(.08),
              ),
            ),
          ),
          Row(
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: Color(0xfffff4db),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                  child: Image.asset(widget.item.imagePath!, fit: BoxFit.cover),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.item.jpName,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),

                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(.25),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        widget.item.enName,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 12),
                child: GestureDetector(
                  onTap: () async {
                    if (isPlaying) {
                      await audioPlayer?.stop();
                      setState(() {
                        isPlaying = false;
                      });
                      return;
                    }
                    audioPlayer ??= AudioPlayer();
                    await audioPlayer?.stop();
                    setState(() {
                      isPlaying = true;
                    });
                    try {
                      await audioPlayer!.play(
                        AssetSource(
                          "sounds/${widget.itemType}/${widget.item.sound}",
                        ),
                      );
                      audioPlayer!.onPlayerComplete.listen((event) {
                        setState(() {
                          isPlaying = false;
                        });
                      });
                    } catch (error) {
                      print(error);
                      setState(() => isPlaying = false);
                    }
                  },

                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 200),
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(isPlaying ? 0.4 : 0.3),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(.3),
                          blurRadius: isPlaying ? 15 : 8,
                          spreadRadius: isPlaying ? 2 : 0,
                        ),
                      ],
                    ),

                    child: Icon(
                      isPlaying ? Icons.stop : Icons.play_arrow,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
