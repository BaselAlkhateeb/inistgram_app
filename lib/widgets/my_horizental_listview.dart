import 'package:flutter/material.dart';
import 'package:instagram_app/data/story_data.dart';
import 'package:instagram_app/widgets/story_item.dart';

class MyHorizentalListView extends StatelessWidget {
  const MyHorizentalListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 124,
      child: ListView.builder(
        
        scrollDirection: Axis.horizontal,
        itemCount: storyList.length,
        itemBuilder: (BuildContext context , int index){
      return StoryItem(obj: storyList[index]) ;
      
      }),
    );
  }
}

