import 'package:flutter/material.dart';
import 'package:instagram_app/widgets/my_app_bar.dart';
import 'package:instagram_app/widgets/my_horizental_listview.dart';
import 'package:instagram_app/widgets/vertical_listview.dart';



class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: MyAppBar()),

            SliverToBoxAdapter(child: MyHorizentalListView()),

            VerticalListView(),
          ],
        ),

       
      ),
    );
  }
}
