import 'package:flutter/material.dart';
import 'package:nti6/onboarding1.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(), 
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
         builder: (context) => const Onboarding1(), 
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, 
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            Container(
              width: 55,
              height: 55,
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromARGB(255, 182, 161, 122), 
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Center(
                child: Text(
                  "L",
                  style: TextStyle(
                    color: Color.fromARGB(255, 182, 161, 122),
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 18),

       
            const Text(
              "LUXE",
              style: TextStyle(
                color: Color.fromARGB(255, 182, 161, 122),
                fontSize: 18,
                letterSpacing: 6, 
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 8),

            Container(
              width: 20,
              height: 1.5,
              color: const Color.fromARGB(255, 182, 161, 122),
            ),
          ],
        ),
      ),
    );
  }
}