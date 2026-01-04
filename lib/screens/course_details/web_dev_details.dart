import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
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

class WebDevDetails extends StatefulWidget {
  final int weekNumber;
  final String courseTitle;

  const WebDevDetails({
    super.key,
    required this.weekNumber,
    this.courseTitle = "Programming Course",
  });

  @override
  State<WebDevDetails> createState() => _WebDevDetailsState();
}

class _WebDevDetailsState extends State<WebDevDetails> {
  //check is completed course
  bool get _allLessonsCompleted {
    return lessons.every((lesson) => lesson.isCompleted);
  }

  final List<Lesson> lessons = [
    Lesson(
      title: "What is Web Development",
      duration: "20 min",
      isVideo: true,
      icon: Icons.play_circle_fill,
      iconColor: Colors.teal,
      isCompleted: true,
      isBook: false,
      pdfUrl: "",
    ),
    Lesson(
      title: "FrontEnd Development",
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
      title: "Development Process",
      duration: "16 min",
      isVideo: true,
      isCompleted: true,
      icon: Icons.play_circle_fill,
      iconColor: Colors.teal,
      isBook: false,
      pdfUrl: "",
    ),
    Lesson(
      title: "UI/UX Designing",
      duration: "47 min",
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
      duration: "45 min",
      isVideo: true,
      isCompleted: true,
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
      // Asking for storage permission
      if (await Permission.storage.request().isDenied) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Storage permission denied")),
        );
        return;
      }
      // Sanitizeing  filename
      String safeTitle = title.replaceAll(RegExp(r'[^\w\s-]'), '_');

      // Set save location
      Directory? downloadsDir;
      if (Platform.isAndroid) {
        downloadsDir = Directory("/storage/emulated/0/Download");
      } else if (Platform.isIOS) {
        downloadsDir = await getApplicationDocumentsDirectory();
      }

      String filePath = "${downloadsDir!.path}/$safeTitle.pdf";

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
        SnackBar(content: Text("Downloaded to: $filePath")),
      );
      // Auto-open PDF after download
      await OpenFilex.open(filePath);
    } catch (e) {
      print("Download error: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Download failed: $e")),
      );
    } finally {
      setState(() {
        isDownloading = false;
      });
    }
  }

  void _showCompletionCelebration() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        icon: Icon(Icons.celebration, size: 50, color: Colors.amber),
        title: Text('Congratulations!',
            style: TextStyle(fontWeight: FontWeight.bold)),
        content: Text('You Have Successfully Completed All Modules!'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK', style: TextStyle(color: AppColors.primaryColor)),
          )
        ],
      ),
    );
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
              if (_allLessonsCompleted) {
                _showCompletionCelebration();
              }
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
              margin: const EdgeInsets.all(14),
              height: 198,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                  image: NetworkImage(
                    'https://wallpapers.com/images/high/web-development-team-collaboration-illustration-yz5n469ruq1f8yb9-2.png',
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
                    'Web Application Development Course',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor),
                  ),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: const Text(
                      'Learn to build modern, responsive web applications using HTML,CSS & php extending your skills beyond mobile to desktop and browser platforms. ',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  const SizedBox(height: 25),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://marketplace.exertiowp.com/wp-content/uploads/2021/01/girl.png'),
                      ),
                      const SizedBox(width: 12),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('By Sarah Wilson',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text('Full Stack web Developer',
                              style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                      const Spacer(),
                      const Text("655 Enrolled"),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),
            Padding(
              padding: EdgeInsets.only(left: 17),
              child: Align(
                alignment: Alignment.centerLeft,
                child: const Text('Course Modules',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor,
                    )),
              ),
            ),

            const SizedBox(height: 16),

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
                    title: Text(lesson.title,
                        style: TextStyle(
                          color:
                              lesson.isCompleted ? Colors.grey : Colors.black,
                          fontWeight: FontWeight.w500,
                        )),
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
            SizedBox(
              height: 40,
            ),
            // Progress indicator when downloading
            if (isDownloading)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: LinearProgressIndicator(value: progress),
              ),
            Column(
              children: [
                Center(
                    child: Text(
                  "Congratulations!",
                  style: TextStyle(
                    color: Colors.green[700],
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                )),
                Center(
                    child: Text(
                  'You Have Completed the Course Successfully!',
                  style: TextStyle(
                    color: Colors.green[600],
                    fontSize: 15,
                  ),
                )),
              ],
            ),
            SizedBox(
              height: 70,
            ),
          ],
        ),
      ),
    );
  }
}
