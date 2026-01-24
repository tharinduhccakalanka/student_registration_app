import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import 'package:student_registration_app/utills/app_colors.dart';

class Lesson {
  final String title;
  final String duration;
  final bool isVideo;
  bool isCompleted;
  final IconData icon;
  final Color iconColor;
  final bool isBook;
  final String pdfUrl;

  Lesson({
    required this.title,
    required this.duration,
    this.isVideo = true,
    this.isCompleted = false,
    required this.icon,
    required this.iconColor,
    required this.isBook,
    required this.pdfUrl,
  });
}

class MobileDevDetails extends StatefulWidget {
  final int weekNumber;
  final String courseTitle;

  const MobileDevDetails({
    super.key,
    required this.weekNumber,
    this.courseTitle = "Programming Course",
  });

  @override
  State<MobileDevDetails> createState() => _MobileDevDetailsState();
}

class _MobileDevDetailsState extends State<MobileDevDetails> {
  final List<Lesson> lessons = [
    Lesson(
      title: "Introduction to Flutter",
      duration: "20 min",
      isVideo: true,
      icon: Icons.play_circle_fill,
      iconColor: Colors.teal,
      isBook: false,
      isCompleted: true,
      pdfUrl: "",
    ),
    Lesson(
      title: "Building First App",
      duration: "10 min",
      isVideo: false,
      isCompleted: true,
      icon: Icons.menu_book,
      iconColor: Colors.orange,
      isBook: true,
      pdfUrl:
          "https://www.cs.cmu.edu/~bam/uicourse/830spring09/BFeiginMobileApplicationDevelopment.pdf",
    ),
    Lesson(
      title: "Advanced UI/UX",
      duration: "3 min",
      isVideo: true,
      icon: Icons.play_circle_fill,
      iconColor: Colors.teal,
      isBook: false,
      isCompleted: true,
      pdfUrl: "",
    ),
    Lesson(
      title: "State Manegemant",
      duration: "10 min",
      isVideo: false,
      isCompleted: true,
      icon: Icons.menu_book,
      iconColor: Colors.orange,
      isBook: true,
      pdfUrl:
          "https://www.cs.cmu.edu/~bam/uicourse/830spring09/BFeiginMobileApplicationDevelopment.pdf",
    ),
    Lesson(
      title: "Backend Development",
      duration: "17 min",
      isVideo: true,
      icon: Icons.play_circle_fill,
      iconColor: Colors.teal,
      isBook: false,
      pdfUrl: "",
    ),
  ];
  bool isDownloading = false;
  double progress = 0.0;

  /// PDF Download Function
  Future<void> downloadPDF(
      String url, String title, BuildContext context) async {
    try {
      final dir = await getApplicationDocumentsDirectory();
      String filePath = "${dir.path}/$title.pdf";

      setState(() {
        isDownloading = true;
        progress = 0.0;
      });

      Dio dio = Dio();
      await dio.download(
        url,
        filePath,
        onReceiveProgress: (received, total) {
          if (total != -1) {
            setState(() {
              progress = received / total;
            });
          }
        },
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Downloaded: $filePath")),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Download failed: $e")),
      );
    } finally {
      setState(() {
        isDownloading = false;
      });
    }
  }

  void _playLesson(Lesson lesson) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(lesson.title),
        content:
            Text(lesson.isVideo ? 'Playing video...' : 'Opening reading...'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() => lesson.isCompleted = true);
            },
            child: const Text('Start'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: const Center(
          child: Padding(
            padding: EdgeInsets.only(right: 40),
            child: Text(
              'Course Details',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        backgroundColor: AppColors.primaryColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Image Preview
            Container(
              margin: const EdgeInsets.all(16),
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: const DecorationImage(
                  image: NetworkImage(
                    'https://static.vecteezy.com/system/resources/previews/002/045/795/non_2x/programmers-developing-mobile-app-flat-design-illustration-vector.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Instructor

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Mobile App Development Course'
                    'Mobile App Development Course'
                    "Mobile App Development Course"
                    ' Mobile App Development Course',

                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor),
                  ),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: const Text(
                      'Master mobile app development with Flutter and Dart, learning to build beautiful, cross-platform applications efficiently. This course covers everything from UI design to state management, helping you launch apps',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  const SizedBox(height: 25),
                  Row(
                    children: [
                      const CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://research-information.bris.ac.uk/ws/files/289846375/John_Reeks.JPG'),
                      ),
                      const SizedBox(width: 12),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('By James Anderson',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text('App Developer',
                              style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                      const Spacer(),
                      const Text("58 Enrolled"),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),
            const Padding(
              padding: EdgeInsets.only(left: 17),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Course Modules',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),

            // Lessons List
            ...lessons.map((lesson) => Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  child: ListTile(
                    onTap: () => _playLesson(lesson),
                    leading: Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: lesson.iconColor.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(lesson.icon, color: lesson.iconColor),
                    ),
                    title: Text(
                      lesson.title,
                      style: TextStyle(
                        color: lesson.isCompleted ? Colors.grey : Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    subtitle: Text(lesson.duration),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (lesson.isBook && lesson.pdfUrl.isNotEmpty)
                          IconButton(
                            icon:
                                const Icon(Icons.download, color: Colors.blue),
                            onPressed: () {
                              downloadPDF(lesson.pdfUrl, lesson.title, context);
                            },
                          ),
                        lesson.isCompleted
                            ? const Icon(Icons.check_circle,
                                color: Colors.green)
                            : const Icon(Icons.radio_button_unchecked,
                                color: Colors.grey),
                      ],
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(color: Colors.grey.shade400),
                    ),
                  ),
                )),
            const SizedBox(height: 30),

            // Progress indicator when downloading
            if (isDownloading)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: LinearProgressIndicator(value: progress),
              ),
          ],
        ),
      ),
    );
  }
}
