import 'user_model.dart';

class PostModel {
  final String id;
  final UserModel user;
  final String content;
  final String imageUrl;
  final int likes;
  final int comments;
  final DateTime timestamp;

  PostModel({
    required this.id,
    required this.user,
    required this.content,
    required this.imageUrl,
    required this.likes,
    required this.comments,
    required this.timestamp,
  });
}
