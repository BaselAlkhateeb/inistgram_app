

class PostItemModel {
  PostItemModel({
    required this.userName , 
    required this.imageProfilePath,
    this.songTitle,
this.songPath,
    required this.postImagePath,
    required this.commentsNumber,
    required this.likesNumber,
    required this.resendsNumber,
    required this.retweetsNumber,
    required this.date,
    this.isLiked = false,
  });
  final String userName;
  final String imageProfilePath;
  final String? songTitle;
  final String? songPath;
  final List<String> postImagePath;
   int likesNumber;
  bool isLiked;
  final int commentsNumber;
  final int retweetsNumber;
  final int resendsNumber;
  final String date;
}
