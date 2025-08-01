import 'package:flutter/material.dart';

void main() {
  runApp(const GreetingApp());
}

class GreetingApp extends StatelessWidget {
  const GreetingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Greeting App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Greeting App'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Styled Text
            const Text(
              'Hello, World!',
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
            ),
            const SizedBox(height: 20),
            
            // Welcome Text
            const Text(
              'Welcome to Flutter!',
              style: TextStyle(
                fontSize: 22,
                color: Colors.blueGrey,
              ),
            ),
            const SizedBox(height: 30),

            // ADD THE FLUTTER LOGO HERE (THIS IS THE EXACT SPOT)
    Image.asset(
      'assets/flutter_logo.png', // Make sure you have this asset
      height: 120,
    ),
    
    const SizedBox(height: 40),
            
            // Network Image with error handling
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                'https://storage.googleapis.com/cms-storage-bucket/0dbfcc7a59cd1cf16282.png',
                height: 180,
                fit: BoxFit.contain,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 180,
                    color: Colors.grey[200],
                    child: const Center(
                      child: Icon(Icons.error, color: Colors.red),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 40),
            
            // Interactive Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Button Pressed!'),
                    behavior: SnackBarBehavior.floating,
                    duration: Duration(seconds: 1),
                  ),
                );
              },
              child: const Text(
                'Press Me',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}