import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:upchat/colors.dart';
import 'package:upchat/firebase_options.dart';
import 'package:upchat/screens/mobileLayoutScreen.dart';
import 'package:upchat/screens/webLayoutScreen.dart';
import 'package:upchat/utils/responsiveLayout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Whatsapp UI',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
      ),
      home: const ResponsiveLayout(
        mobileScreenLayout: MobileLayoutScreen(),
        webScreenLayout: WebLayoutScreen(),
      ),
    );
  }
}
