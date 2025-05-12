// home_viewmodel.dart
import 'package:flutter/material.dart';
import 'package:ilabs/auth/model/post_model.dart';
import 'package:ilabs/auth/model/user_model.dart';

class HomeViewModel extends ChangeNotifier {
  final List<UserModel> _storyUsers = [
    UserModel(
      email: 'Samantha@demo.com',
      password: 'password123',
      fullName: 'Samantha disa',
      bio: 'UX Designer',
      profileImage: 'assets/images/user1.jpg',
      bannerImage: 'assets/images/banner1.jpg',
    ),
    UserModel(
      email: 'visaka@demo.com',
      password: 'password123',
      fullName: 'Visaka Jayasuriya',
      bio: 'iOS Developer',
      profileImage: 'assets/images/user2.jpg',
      bannerImage: 'assets/banner2.png',
    ),
    UserModel(
      email: 'Kamal@demo.com',
      password: 'password123',
      fullName: 'Kamal Perera',
      bio: 'React Developer',
      profileImage: 'assets/images/user3.jpg',
      bannerImage: 'assets/banner3.png',
    ),
    UserModel(
      email: 'Shanthi@demo.com',
      password: 'password123',
      fullName: 'Shanthi Kumari',
      bio: 'Content Lead',
      profileImage: 'assets/images/user4.jpg',
      bannerImage: 'assets/banner4.png',
    ),
  ];

  final List<PostModel> _posts = [
    PostModel(
      id: 'p1',
      user: UserModel(
        email: 'Samantha@demo.com',
        password: 'pass123',
        fullName: 'Samantha disa',
        bio: 'Android Dev at Nika',
        profileImage: 'assets/images/user1.jpg',
        bannerImage: 'assets/images/banner1.jpg',
      ),
      content:
          'Creating opportunity for every member of the global workforce drives everything we do at Link...',
      imageUrl: 'assets/images/post1.jpg',
      likes: 97,
      comments: 77,
      timestamp: DateTime.now().subtract(const Duration(hours: 1)),
    ),
    PostModel(
      id: 'p2',
      user: UserModel(
        email: 'visaka@demo.com',
        password: 'pass123',
        fullName: 'Visaka Jayasuriya',
        bio: 'Web Dev at CodeTech',
        profileImage: 'assets/images/user2.jpg',
        bannerImage: 'assets/images/banner2.jpg',
      ),
      content:
          'Just wrapped a sprint on Flutter apps — feels awesome to see progress.',
      imageUrl: 'assets/images/post2.png',
      likes: 55,
      comments: 20,
      timestamp: DateTime.now().subtract(const Duration(hours: 3)),
    ),
  ];

  List<UserModel> get storyUsers => _storyUsers;
  List<PostModel> get posts => _posts;
}
