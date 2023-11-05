import 'package:deardiary/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

import '/view/diary_login_view.dart';
import '/view/diary_signup_view.dart';
import 'package:flutter/material.dart';
import 'controller/diary_controller.dart';
import 'view/diary_forgot_passowrd_view.dart';
import 'view/diary_log_view.dart';
import 'view/diary_entry_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final diaryController = DiaryController();
  // await diaryController.init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp(diaryController: diaryController));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required DiaryController diaryController});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dear Diary',
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 0, 0, 0),
      ),
      home: WelcomePage(),
      routes: {
        '/diaryLogView': (context) => const DiaryLogView(),
        '/diaryEntryView': (context) => DiaryEntryView(),
        '/loginView': (context) => LoginView(),
        '/signupView': (context) => SignupView(),
        '/forgotPasswordView': (context) => ForgotPasswordView(),
        // Add more routes for other pages here
      },
    );
  }
}

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    super.initState();

    // Delay for 1.5 seconds and then navigate to DiaryLogView
    Future.delayed(const Duration(seconds: 1, milliseconds: 500), () {
      Navigator.pushReplacementNamed(context, '/loginView');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.book,
              size: 100,
              color: Theme.of(context).primaryColor,
            ),
            SizedBox(height: 20),
            Text(
              'Dear Diary',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            const SizedBox(height: 20),
            // You can remove the "Get Started" button
          ],
        ),
      ),
    );
  }
}
