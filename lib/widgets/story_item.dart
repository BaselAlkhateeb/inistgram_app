import 'package:flutter/material.dart';
import 'package:instagram_app/Models/story_item_model.dart';
import 'package:instagram_app/screens/story.dart';


class StoryItem extends StatelessWidget {
  const StoryItem({
    required this.obj,
    super.key,
  });

final StoryItemModel obj;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: (){
Navigator.push(context, MaterialPageRoute(builder: (BuildContext content){

  return StoryScreen(obj: obj,);
}));
            },
            
            child: Container(
              padding: EdgeInsets.all(2.5),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.pink , 
                  Colors.purple ,
                  Colors.pink , 
            
                  Colors.amber
                ]),
                borderRadius: BorderRadius.circular(200),
              ),
            
              child: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.black,
                child: CircleAvatar(radius: 38, backgroundImage:AssetImage(obj.imagePath )),
              ),
            ),
          ),
          SizedBox(height: 3,),
          SizedBox(
            width: 80,
            child: Center(child: Text(obj.userName , style: TextStyle(fontSize: 12 , color: Colors.white , overflow: TextOverflow.ellipsis),)))
        ],
      ),
    );
  }
}
