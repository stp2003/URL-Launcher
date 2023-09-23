import 'dart:io';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'URL Launcher',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22.0,
            letterSpacing: 0.8,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            launcherButton(
              title: 'Phone Number Launcher',
              icon: Icons.phone,
              onPressed: () async {
                Uri uri = Uri.parse('tel:+919336908109');
                if (!await launcher.launchUrl(uri)) {
                  debugPrint('No');
                }
              },
            ),
            launcherButton(
              title: 'Website Launcher',
              icon: Icons.language,
              onPressed: () {
                launcher.launchUrl(
                  Uri.parse('https://pub.dev/packages/url_launcher'),
                  mode: launcher.LaunchMode.externalApplication,
                );
              },
            ),
            launcherButton(
              title: 'SMS Launcher',
              icon: Icons.message,
              onPressed: () => launcher.launchUrl(
                Uri.parse(
                    'sms:9336908109${Platform.isAndroid ? '?' : '&'}body=Message from app'),
              ),
            ),
            launcherButton(
              title: 'Mail Launcher',
              icon: Icons.mail,
              onPressed: () async {
                Uri uri = Uri.parse('mailto:shashwatshandilya2003@gmail.com');
                if (!await launcher.launchUrl(uri)) {
                  debugPrint('No');
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget launcherButton({
    required String title,
    required IconData icon,
    required Function() onPressed,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          backgroundColor: const Color.fromRGBO(32, 28, 76, 1.0),
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 10.0,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.white70,
            ),
            const SizedBox(width: 20.0),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
