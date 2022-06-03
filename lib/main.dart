import 'package:doctor_app/text_style.dart';
import 'package:doctor_app/ui/screens/authentication/sign_in_screen.dart';
import 'package:doctor_app/ui/screens/authentication/sign_up_screen.dart';
import 'package:doctor_app/ui/screens/doctors/doctor_profile.dart';
import 'package:doctor_app/ui/screens/home.dart';
import 'package:doctor_app/ui/screens/navigation/main_navigator.dart';
import 'package:doctor_app/ui/screens/profile/settings.dart';
import 'package:doctor_app/ui/screens/welcome/onboarding.dart';
import 'package:doctor_app/ui/screens/welcome/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MediDoc',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          iconTheme: const IconThemeData(color: headerTextColor),
          titleTextStyle: headerTextStyle.copyWith(fontSize: headline3),
          actionsIconTheme: const IconThemeData(color: headerTextColor),
        ),
        primarySwatch: Colors.blue,
        primaryColor: primaryColor,
        textTheme: Theme.of(context).textTheme.apply(displayColor: textColor),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: TextButton.styleFrom(
            backgroundColor: primaryColor,
            padding: const EdgeInsets.all(defaultPadding),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: textFieldBorder,
          enabledBorder: textFieldBorder,
          focusedBorder: textFieldBorder,
        ),
      ),
      initialRoute: OnBoarding.id,
      routes: {
        OnBoarding.id: (context) => const OnBoarding(),
        WelcomeScreen.id: (context) => const WelcomeScreen(),
        HomeScreen.id: (context) => const HomeScreen(),
        MainNavigation.id: (context) => const MainNavigation(),
        SignInScreen.id: (context) => SignInScreen(),
        SignUpScreen.id: (context) => SignUpScreen(),
        DoctorProfile.id: (context) => const DoctorProfile(),
        Settings.id: (context) => const Settings()
      },
    );
  }
}
