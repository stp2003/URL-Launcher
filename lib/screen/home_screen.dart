import 'dart:io';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('URL Launcher'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            launcherButton(
              title: 'Phone Number',
              icon: Icons.phone,
              onPressed: () async {
                Uri uri = Uri.parse('tel:+919336908109');
                if (!await launcher.launchUrl(uri)) {
                  debugPrint('couldnt');
                }
                ;
              },
            ),
            launcherButton(
              title: 'Website',
              icon: Icons.language,
              onPressed: () {
                launcher.launchUrl(
                  Uri.parse('https://pub.dev/packages/url_launcher'),
                  mode: launcher.LaunchMode.externalApplication,
                );
              },
            ),
            launcherButton(
              title: 'SMS',
              icon: Icons.message,
              onPressed: () => launcher.launchUrl(
                Uri.parse(
                    'sms:9336908109${Platform.isAndroid ? '?' : '&'}body=Message from app'),
              ),
            ),
            launcherButton(
              title: 'Mail',
              icon: Icons.mail,
              onPressed: () async {
                Uri uri = Uri.parse('mailto:shashwatshandilya2003@gmail.com');
                if (!await launcher.launchUrl(uri)) {
                  debugPrint('couldnt');
                }
                ;
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
    return Container(
      child: ElevatedButton(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon),
            const SizedBox(width: 20),
            Text(title),
          ],
        ),
      ),
    );
  }
}
