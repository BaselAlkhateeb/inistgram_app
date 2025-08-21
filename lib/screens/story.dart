import 'package:flutter/material.dart';
import 'package:instagram_app/Models/story_item_model.dart';

class StoryScreen extends StatelessWidget {
  const StoryScreen({required this.obj, super.key});
  final StoryItemModel obj;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(obj.storyContanetPath ) , fit: BoxFit.cover)
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                
                // شريط ابيض متقطع
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              image: DecorationImage(
                                image: AssetImage(obj.imagePath),
                                fit: BoxFit.cover,
                              ),
                            ),
                            
                          ),
                          SizedBox(width: 5,),
                          Text(
                            obj.userName,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 5,),
                          Text('8h', style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.more_vert_outlined, color: Colors.white),
                      ),
                    ],
                  ),
                ),

                Container(
                  color: Colors.black,
                  padding: EdgeInsets.all(8),
                  child: Row(
                    children: [
                      IconButton(onPressed: (){}, icon: Icon(Icons.chat_bubble_outline , color: Colors.white, size: 30,)),
                      SizedBox(
                        width: 200,
                        height: 45,
                        child: TextField(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: Colors.grey , width: 1)
                            ) , 
                            focusedBorder: OutlineInputBorder( 
                               borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: Colors.grey , width: 1)
                            ) , 
                            hintText: 'Send message',
                            hintStyle: TextStyle(color: Colors.white , fontSize: 14),
                          ),
                        ),
                      ) , 
                      IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border , color: Colors.white,size: 30,)),
                      IconButton(onPressed: (){}, icon:Image.asset('assets/images/png/message.png') )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
