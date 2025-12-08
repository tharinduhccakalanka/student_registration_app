import 'package:flutter/material.dart';

import 'package:student_registration_app/screens/course_details/mern_details.dart';
import 'package:student_registration_app/screens/course_details/mobile_dev_details.dart';
import 'package:student_registration_app/screens/course_details/web_dev_details.dart';
import 'package:student_registration_app/screens/main/profile/profile.dart';
import 'package:student_registration_app/utills/app_colors.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  final TextEditingController _searchController = TextEditingController();
  String searchQuery = "";

  final List<Map<String, dynamic>> courses = [
    {
      "title": "Mobile Application",
      "instructor": "James Anderson",
      "image":
          "https://research-information.bris.ac.uk/ws/files/289846375/John_Reeks.JPG",
      "color": Colors.tealAccent.shade100,
      "widget": const MobileDevDetails(weekNumber: 1),
    },
    {
      "title": "Web Application",
      "instructor": "Sarah Wilson",
      "image":
          "https://marketplace.exertiowp.com/wp-content/uploads/2021/01/girl.png",
      "color": Colors.blueGrey.shade100,
      "widget": const WebDevDetails(weekNumber: 1),
    },
    {
      "title": "MERN Stack",
      "instructor": "John Carter",
      "image":
          "https://media.hiredchina.com/2024/09/20240909051238727-1024x683.jpg?imageView2/0/format/webp/q/75",
      "color": Colors.amber.shade100,
      "widget": const MernDetails(weekNumber: 1),
    },
  ];

  List<Map<String, dynamic>> get filteredCourses {
    if (searchQuery.isEmpty) {
      return courses;
    }
    return courses
        .where((course) =>
            course["title"].toString().toLowerCase() ==
            searchQuery.toLowerCase())
        .toList();
  }

  void _searchCourse() {
    setState(() {
      searchQuery = _searchController.text.trim();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          // Header
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Profile()),
                  );
                },
                child: const CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage('assets/images/tharindu.jpg'),
                ),
              ),
              SizedBox(width: 12),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Hello, Tharindu",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                  ],
                ),
              ),
              const Icon(Icons.notifications_none, size: 28),
            ],
          ),
          const SizedBox(height: 1),
          const Divider(thickness: 0.5, color: Colors.blueGrey),
          const SizedBox(height: 30),

          // Search bar
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.blueGrey),
              borderRadius: BorderRadius.circular(25),
            ),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "Search Course",
                border: InputBorder.none,
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: _searchCourse,
                ),
              ),
              onSubmitted: (_) => _searchCourse(),
            ),
          ),
          const SizedBox(height: 25),

          // Banner
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.blue.shade900,
                  Colors.deepPurple.shade100,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Find Your Course",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18)),
                      const SizedBox(height: 10),
                      const Text(
                        "Discover a world of knowledge and take the first step toward mastering new skills",
                        style: TextStyle(color: Colors.white70, fontSize: 12),
                      ),
                      const SizedBox(height: 15),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        onPressed: () {},
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text("Read More",
                                style: TextStyle(
                                    color: Colors.deepPurple,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(width: 8),
                            Icon(Icons.arrow_forward,
                                color: Colors.deepPurple, size: 18),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Transform.rotate(
                  angle: 50,
                  child: Image.asset(
                    "assets/images/cup.png",
                    width: 110,
                    height: 130,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 35),

          // Popular courses title
          Text("Popular Courses",
              style: TextStyle(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20)),
          const SizedBox(height: 14),

          // Filtered course cards
          if (filteredCourses.isEmpty)
            const Center(
              child: Text(
                "No course found",
                style: TextStyle(fontSize: 16, color: Colors.red),
              ),
            )
          else
            Column(
              children: filteredCourses.map((course) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => course["widget"] as Widget));
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                      color: course["color"],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 35,
                          backgroundImage: NetworkImage(course["image"]),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(course["title"],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16)),
                              Text(course["instructor"],
                                  style: const TextStyle(color: Colors.grey)),
                            ],
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                          ),
                          padding: const EdgeInsets.all(8),
                          child: const Icon(Icons.arrow_forward_rounded,
                              color: Colors.white),
                        )
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
        ],
      ),
    );
  }
}

// ------------------- OTHER TABS -------------------
class MyCourseContent extends StatelessWidget {
  const MyCourseContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text("My Courses Page", style: TextStyle(fontSize: 20)));
  }
}

class ChatListContent extends StatelessWidget {
  const ChatListContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text("Chat List Page", style: TextStyle(fontSize: 20)));
  }
}

class ProfileContent extends StatelessWidget {
  const ProfileContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text("Profile Page", style: TextStyle(fontSize: 20)));
  }
}
