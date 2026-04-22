import 'package:flutter/material.dart';

class Trail extends StatefulWidget {
  const Trail({super.key});

  @override
  State<Trail> createState() => _TrailState();
}

class _TrailState extends State<Trail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Trail Screen '),
        
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/coming_soon.png', width: 200, height: 200),
            const SizedBox(height: 16),
            const Text(
              'Testing the whole app maintainence here',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Testing the whole app maintainence here',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Testing the whole app maintainence here',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Testing the whole app maintainence here',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            Center(
              child: ElevatedButton(
               onPressed: () {
                
            },
            child: Text('Continue'),
  ),
)
          ],
        ),
      ),



      
    );
  }
}
