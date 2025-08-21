import 'package:flutter/material.dart';
import 'package:instagram_app/screens/navigationbarscreen.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      
      home: Navigationbarscreen(),
    );
  }
}