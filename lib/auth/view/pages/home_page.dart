import 'package:flutter/material.dart';
import 'package:ilabs/auth/view/pages/profile_page.dart';
import 'package:ilabs/auth/viewmodel/home_viewmodel.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<HomeViewModel>(context);
    final stories = viewModel.storyUsers;
    final posts = viewModel.posts;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ProfilePage(),
                  ),
                );
              },
              child: const CircleAvatar(
                backgroundImage: AssetImage('assets/images/user5.jpg'),
                radius: 20,
              ),
            ),
            Image.asset(
              'assets/images/splash.png',
              height: 100,
            ),
            Icon(Icons.notifications_none, color: Colors.grey[700]),
          ],
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: stories.length,
              itemBuilder: (_, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(stories[index].profileImage),
                      radius: 30,
                    ),
                    const SizedBox(height: 5),
                    Text(stories[index].fullName,
                        style: const TextStyle(fontSize: 12)),
                  ],
                ),
              ),
            ),
          ),
          const Divider(),
          ...posts.map((post) => Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                        backgroundImage: AssetImage(post.user.profileImage)),
                    title: Text(post.user.fullName),
                    subtitle: Text(post.content),
                  ),
                  if (post.imageUrl.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(post.imageUrl),
                      ),
                    ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Stack(
                              children: [
                                Positioned(
                                  left: 40,
                                  child: CircleAvatar(
                                    radius: 10,
                                    backgroundImage:
                                        AssetImage('assets/images/user3.jpg'),
                                  ),
                                ),
                                Positioned(
                                  left: 20,
                                  child: CircleAvatar(
                                    radius: 10,
                                    backgroundImage:
                                        AssetImage('assets/images/user2.jpg'),
                                  ),
                                ),
                                CircleAvatar(
                                  radius: 10,
                                  backgroundImage:
                                      AssetImage('assets/images/user1.jpg'),
                                ),
                              ],
                            ),
                            const SizedBox(width: 8),
                            const Text.rich(
                              TextSpan(
                                text: 'Liked by ',
                                children: [
                                  TextSpan(
                                      text: 'saja',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(text: ' and '),
                                  TextSpan(
                                      text: '93 others',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                            const Spacer(),
                            Text('${post.comments} comments',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            Icon(Icons.thumb_up_alt_outlined,
                                color: Colors.grey),
                            Icon(Icons.chat_bubble_outline, color: Colors.grey),
                            Icon(Icons.share_outlined, color: Colors.grey),
                            Icon(Icons.bookmark_border, color: Colors.grey),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color.fromARGB(255, 72, 165, 242),
        child: const Icon(Icons.add, size: 28),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.home),
              color: const Color.fromARGB(255, 72, 165, 242),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.people),
              color: Colors.grey,
              onPressed: () {},
            ),
            const SizedBox(width: 40),
            IconButton(
              icon: const Icon(Icons.chat_bubble_outline),
              color: Colors.grey,
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.work_outline),
              color: Colors.grey,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
