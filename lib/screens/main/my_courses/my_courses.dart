import 'package:flutter/material.dart';
import 'package:student_registration_app/screens/course_details/mern_details.dart';
import 'package:student_registration_app/screens/course_details/mobile_dev_details.dart';
import 'package:student_registration_app/screens/course_details/web_dev_details.dart';

import 'package:student_registration_app/utills/app_colors.dart';

class MyCourses extends StatefulWidget {
  const MyCourses({super.key});

  @override
  State<MyCourses> createState() => _MyCoursesState();
}

class _MyCoursesState extends State<MyCourses> {
  int _selectedTab = 0; // 0: All, 1: Ongoing, 2: Completed

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: const Center(
            child: Text(
          "My Courses",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        )),
        backgroundColor: AppColors.primaryColor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(27),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue.shade900, Colors.blue.shade100],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                    image: AssetImage("assets/images/image-7.png"),
                    fit: BoxFit.contain,
                    alignment: Alignment.topRight),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.6),
                    child: const Text(
                      'Explore Your \n Courses',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Filter Tabs (All, Ongoing, Completed)
            SizedBox(
              height: 50,
              child: Row(
                children: [
                  Expanded(
                    child: _buildFilterTab('All', 0),
                  ),
                  Expanded(
                    child: _buildFilterTab('Ongoing', 1),
                  ),
                  Expanded(
                    child: _buildFilterTab('Completed', 2),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Course Cards - Filtered based on selection
            if (_selectedTab == 0 ||
                _selectedTab == 1) // Showing All or Ongoing
              _buildCourseCard(
                title: 'Mobile Application Development',
                description:
                    'Combining design creativity with technical App development skills',
                progress: 0.7,
                color: Colors.deepPurple[100]!,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MobileDevDetails(
                        weekNumber: 1,
                        courseTitle: 'Mobile Application Development',
                      ),
                    ),
                  );
                },
              ),

            if (_selectedTab == 0 ||
                _selectedTab == 1) // Showing All or Ongoing
              const SizedBox(height: 20),

            if (_selectedTab == 0 ||
                _selectedTab == 2) // Showing All or Completed
              _buildCourseCard(
                title: 'Web Application Development ',
                description:
                    'Congratulations! You completed the Web Application course 100%.',
                progress: 1.0,
                color: Colors.green[100]!,
                isComplete: true,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WebDevDetails(
                        weekNumber: 3,
                        courseTitle: 'Web Application Development',
                      ),
                    ),
                  );
                },
              ),
            if (_selectedTab == 0 || _selectedTab == 2) // Show All or Completed
              const SizedBox(height: 20),

            if (_selectedTab == 0 || _selectedTab == 1) // Show All or Ongoing
              _buildCourseCard(
                title: 'MERN Stack',
                description: 'Enhance your Framework  skills.',
                progress: 0.3,
                color: Colors.blue[100]!,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MernDetails(
                        weekNumber: 3,
                        courseTitle: 'MERN Stack Development',
                      ),
                    ),
                  );
                },
              ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(0.1)),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
        ),
      ),
    );
  }

  Widget _buildFilterTab(String text, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTab = index;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: _selectedTab == index
                  ? AppColors.primaryColor
                  : Colors.transparent,
              width: 3,
            ),
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color:
                  _selectedTab == index ? AppColors.primaryColor : Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCourseCard({
    required String title,
    required String description,
    required double progress,
    required Color color,
    bool isComplete = false,
    VoidCallback? onTap,
  }) {
    return Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(description),
          const SizedBox(height: 15),
          LinearProgressIndicator(
            value: progress,
            backgroundColor: Colors.grey[300],
            valueColor: AlwaysStoppedAnimation<Color>(
              isComplete ? Colors.green : Colors.blue,
            ),
          ),
          const SizedBox(height: 5),
          if (onTap != null)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: onTap,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    minimumSize: const Size(80, 30),
                  ),
                  child: Row(
                    children: [
                      const Text("View Details"),
                      SizedBox(
                        width: 4,
                      ),
                      Icon(
                        Icons.arrow_forward,
                        size: 18,
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Text(
                      'Completed ${(progress * 100).round()}%',
                      style: const TextStyle(fontSize: 12),
                    ),
                    if (isComplete)
                      const Padding(
                        padding: EdgeInsets.only(left: 8),
                        child: Icon(Icons.check_circle,
                            color: Colors.green, size: 16),
                      ),
                  ],
                ),
              ],
            )
        ]));
  }
}
