import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:toku_app/models/phrases_model.dart';

class BuildPhrasesItem extends StatefulWidget {
  const BuildPhrasesItem({
    super.key,
    required this.item,
    required this.colorOne,
    required this.colorTwo,
    required this.itemType,
  });

  final Phrases item;
  final Color colorOne;
  final Color colorTwo;
  final String itemType;

  @override
  State<BuildPhrasesItem> createState() => _BuildPhrasesItemState();
}

class _BuildPhrasesItemState extends State<BuildPhrasesItem> {
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
              SizedBox(width: 16),
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.25),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Icon(Icons.format_quote, color: Colors.white, size: 32),
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
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
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
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
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
