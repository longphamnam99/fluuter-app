class PostModel {
  String authorName;
  String authorImageUrl;
  String timeAgo;
  String imageUrl;

  PostModel({
    required this.authorName,
    required this.authorImageUrl,
    required this.timeAgo,
    required this.imageUrl,
  });
}

final List<PostModel> posts = [
  PostModel(
    authorName: 'Yumi',
    authorImageUrl: 'assets/images/user0.png',
    timeAgo: '5 min',
    imageUrl: 'assets/images/post0.jpg',
  ),
  PostModel(
    authorName: 'Caitlyn',
    authorImageUrl: 'assets/images/user1.png',
    timeAgo: '10 min',
    imageUrl: 'assets/images/post1.jpg',
  ),
  PostModel(
    authorName: 'Sona',
    authorImageUrl: 'assets/images/user2.png',
    timeAgo: '15 min',
    imageUrl: 'assets/images/post0.jpg',
  ),
  PostModel(
    authorName: 'Vayne',
    authorImageUrl: 'assets/images/user3.png',
    timeAgo: '20 min',
    imageUrl: 'assets/images/post1.jpg',
  ),
];

final List<String> stories = [
  'assets/images/user1.png',
  'assets/images/user2.png',
  'assets/images/user3.png',
  'assets/images/user4.png',
  'assets/images/user0.png',
  'assets/images/user1.png',
  'assets/images/user2.png',
  'assets/images/user3.png',
];
