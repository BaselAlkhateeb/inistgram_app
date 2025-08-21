import 'package:flutter/material.dart';
import 'package:instagram_app/data/post_data.dart';
import 'package:instagram_app/widgets/post_item.dart';

class VerticalListView extends StatelessWidget {
  const VerticalListView({super.key});

  @override
  Widget build(BuildContext context) {
    
    return SliverList(
      
      delegate: SliverChildBuilderDelegate(
        
        childCount: postsList.length,
        (context, index) => PostItem(obj: postsList[index]),
      ),
    );



    // return ListView.builder(
    //   //physics: BouncingScrollPhysics(),

    //   itemCount: postsList.length,
    //   itemBuilder: (BuildContext context, int index) {
    //     return PostItem(obj: postsList[index]);
    //   },
    // );
  }
}
