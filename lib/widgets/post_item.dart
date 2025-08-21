import 'dart:async';

import 'package:flutter/material.dart';
import 'package:instagram_app/Models/post_item_model.dart';
// import 'package:instagram_app/widgets/post_widgets/header_row.dart';
// import 'package:instagram_app/widgets/post_widgets/middle_area.dart';
// import 'package:instagram_app/widgets/post_widgets/trailing_area.dart';
import 'package:intl/intl.dart';
import 'package:just_audio/just_audio.dart';

class PostItem extends StatefulWidget {
  const PostItem({required this.obj, super.key});
  final PostItemModel obj;

  @override
  State<PostItem> createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> {
  bool showHeart = false;
  int currentIndex = 0;
  bool isSoundPlaying = true;
  late AudioPlayer _player;
@override
void initState() {
  super.initState();
  _player = AudioPlayer();

  // الاستماع لتغيرات حالة التشغيل
  _player.playerStateStream.listen((state) {
    if (mounted) {
      setState(() {
        isSoundPlaying = state.playing;
      });

      // إذا انتهت الأغنية
      if (state.processingState == ProcessingState.completed) {
        _player.seek(Duration.zero); // إعادة البداية
        _player.play(); // وتشغيلها تلقائياً
      }
    }
  });
}


Future<void> _toggleSound() async {
  if (widget.obj.songPath == null) return;

  if (_player.playing) {
    await _player.pause();
  } else {
    if (_player.audioSource == null) {
      await _player.setAsset(widget.obj.songPath!);
    }
    await _player.play();
  }

  // لا حاجة لتحديث setState هنا، لأن listener سيقوم بذلك
}


  @override
  void dispose() {
    _player.dispose(); // تنظيف عند إغلاق الـ Widget
    super.dispose();
  }

  void handleDoubleTap() {
    setState(() {
      if (!widget.obj.isLiked) {
        // أول مرة → يعمل لايك + قلب كبير
        widget.obj.isLiked = true;
        widget.obj.likesNumber++;
        showHeart = true;

        Timer(Duration(milliseconds: 500), () {
          if (mounted) {
            setState(() {
              showHeart = false;
            });
          }
        });
      } else {
        // إذا كان already liked → يعمل unlike بدون قلب
        widget.obj.isLiked = false;
        widget.obj.likesNumber--;
        showHeart = false;
      }
    });
  }

 

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header area
          headerArea(),

          // middle area
          middleArea(context),

          // Trailing area
          trailingArea(),

          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(widget.obj.date, style: TextStyle(color: Colors.grey)),
          ),
        ],
      ),
    );
  }

  Row headerArea() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage(widget.obj.imageProfilePath),
              ),
            ),

            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    widget.obj.userName,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                if (widget.obj.songTitle != null)
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.music_note, size: 18),

                      Text(
                        widget.obj.songTitle!,
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ),
                    ],
                  ),
              ],
            ),
          ],
        ),
        IconButton(onPressed: () {}, icon: Icon(Icons.more_vert_outlined)),
      ],
    );
  }

  GestureDetector middleArea(BuildContext context) {
    return GestureDetector(
      onDoubleTap: handleDoubleTap,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: 470,
            width: MediaQuery.sizeOf(context).width,
            child: Column(
              children: [
                Stack(
                  alignment: AlignmentDirectional.topEnd,
                  children: [
                    SizedBox(
                      height: 450,
                      child: PageView.builder(
                        itemCount: widget.obj.postImagePath.length,
                        onPageChanged: (index) {
                          setState(() {
                            currentIndex = index;
                          });
                        },
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  widget.obj.postImagePath[index],
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    if (widget.obj.postImagePath.length != 1)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 40,
                          height: 25,

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.black.withAlpha((255 * 0.7).round()),
                          ),
                          child: Center(
                            child: Text(
                              '${currentIndex + 1} / ${widget.obj.postImagePath.length}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),

                if (widget.obj.postImagePath.length != 1)
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        widget.obj.postImagePath.length,
                        (index) => Padding(
                          padding: const EdgeInsets.all(2),
                          child: CircleAvatar(
                            radius: (index == currentIndex)
                                ? 3
                                : (index == widget.obj.postImagePath.length - 1)
                                ? 1.5
                                : 2,
                            backgroundColor: (index == currentIndex)
                                ? const Color.fromARGB(255, 60, 1, 255)
                                : Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),

          AnimatedScale(
            scale: showHeart ? 1.2 : 0.5,
            curve: Curves.easeOut,
            duration: const Duration(milliseconds: 300),
            child: AnimatedOpacity(
              opacity: showHeart ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 300),
              child: Icon(Icons.favorite, color: Colors.white, size: 100),
            ),
          ),

          if (widget.obj.songTitle != null && widget.obj.songPath != null)
            Positioned(
              bottom: 14,
              right: 8,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: InkWell(
                  borderRadius: BorderRadius.circular(18),
                  onTap: 
                    _toggleSound,
                  child: CircleAvatar(
                    radius: 18,
                    backgroundColor: Colors.black.withAlpha((255*0.5).round()),
                    child: Icon(
                      isSoundPlaying
                          ? Icons.volume_up
                          : Icons.volume_off_rounded,
                      size: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Row trailingArea() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,

          children: [
            SizedBox(width: 10),
            IconButton(
              onPressed: handleDoubleTap,
              icon: Icon(
                widget.obj.isLiked ? Icons.favorite : Icons.favorite_border,
                color: widget.obj.isLiked ? Colors.red : Colors.white,
              ),
            ),
            Text(
              NumberFormat.decimalPattern().format(widget.obj.likesNumber),
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(width: 10),

            GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.chat_bubble_outline,
                color: Colors.white,
                size: 30,
              ),
            ),
            Text(
              NumberFormat.decimalPattern().format(widget.obj.commentsNumber),
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(width: 10),

            GestureDetector(
              onTap: () {},
              child: Icon(Icons.repeat, color: Colors.white, size: 30),
            ),
            Text(
              NumberFormat.decimalPattern().format(widget.obj.retweetsNumber),
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(width: 10),

            GestureDetector(
              onTap: () {},
              child: Icon(Icons.send, color: Colors.white, size: 30),
            ),
            Text(
              NumberFormat.decimalPattern().format(widget.obj.resendsNumber),
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.bookmark_border_outlined,
            color: Colors.white,
            size: 30,
          ),
        ),
      ],
    );
  }
}
