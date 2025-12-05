// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:url_launcher/url_launcher.dart';

class WelcomePage5Star extends StatelessWidget {
  final double width;
  final double height;

  const WelcomePage5Star({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // 5Star dark theme
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              Image.asset(
                'assets/images/5star_logo.png', // Make sure this image exists in your assets
                width: 120,
              ),
              SizedBox(height: 24),

              // Welcome text
              Text(
                'Welcome to 5Star Wireless',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),

              Text(
                'Get the phone you want, your way.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                  fontStyle: FontStyle.italic,
                ),
              ),
              SizedBox(height: 32),

              // Get Started Button
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                      context, '/signupPage'); // Replace with your real route
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.cyanAccent[700],
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Get Started',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
              SizedBox(height: 16),

              // Continue as Guest Button
              OutlinedButton(
                onPressed: () {
                  Navigator.pushNamed(
                      context, '/homePage'); // Replace with your real route
                },
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.white),
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Continue as Guest',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 32),

              // Emoji Slogan
              Text(
                '📱 Fast Phones   💸 Easy Payments   🔐 No Credit Checks',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white70,
                ),
              ),
              SizedBox(height: 24),

              // Footer Links
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () async {
                      await launchUrl(Uri.parse(
                        'https://5star-wireless.com/policies/privacy-policy',
                      ));
                    },
                    child: Text(
                      'Privacy Policy',
                      style: TextStyle(
                        color: Colors.white60,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  GestureDetector(
                    onTap: () async {
                      await launchUrl(Uri.parse(
                        'https://5star-wireless.com/policies/terms-of-service',
                      ));
                    },
                    child: Text(
                      'Terms of Use',
                      style: TextStyle(
                        color: Colors.white60,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
