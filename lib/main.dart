import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:upchat/colors.dart';
import 'package:upchat/features/landing/screens/landing_screen.dart';
import 'package:upchat/firebase_options.dart';
import 'package:upchat/router.dart';
// import 'package:upchat/screens/mobileLayoutScreen.dart';
// import 'package:upchat/screens/webLayoutScreen.dart';
// import 'package:upchat/utils/responsiveLayout.dart';

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
        appBarTheme:const AppBarTheme(color: appBarColor),
        scaffoldBackgroundColor: backgroundColor,
      ),
      onGenerateRoute:(settings) => generateRoute(settings),
      home: const LandingScreen()
      // const ResponsiveLayout(
      //   mobileScreenLayout: MobileLayoutScreen(),
      //   webScreenLayout: WebLayoutScreen(),
      // ),
    );
  }
}
