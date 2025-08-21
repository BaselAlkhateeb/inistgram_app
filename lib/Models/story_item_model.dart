class StoryItemModel {
  StoryItemModel({
    required this.userName,
    required this.imagePath,
    required this.storyContanetPath,
    this.songPath,
     this.durationinSeconds,

  });
  final String userName;
  final String imagePath;
  final String storyContanetPath;
  final String? songPath;
  final  int? durationinSeconds ;
}
