import 'package:doctor_app/constants.dart';
import 'package:doctor_app/ui/screens/authentication/sign_in_screen.dart';
import 'package:doctor_app/ui/screens/authentication/sign_up_screen.dart';
import 'package:doctor_app/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  static const String id = "welcome screen route";
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/blue_bg.jpg"), fit: BoxFit.fill),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          children: [
            const Spacer(flex: 5),
            Image.asset(
              "assets/images/logo.png",
              width: MediaQuery.of(context).size.width * 0.7,
            ),
            const Spacer(flex: 3),
            CustomButton(
                label: "Sign In",
                color: const Color(0xFF6CD8D1),
                width: 500,
                height: 50,
                onPressed: () {
                  Navigator.popAndPushNamed(context, SignInScreen.id);
                },
                radius: 10,
                textColor: primaryColor2),
            const SizedBox(height: defaultPadding),
            CustomButton(
                label: "Sign Up",
                color: Colors.transparent,
                width: 500,
                height: 50,
                borderSideColor: primaryColor2,
                onPressed: () {
                  Navigator.popAndPushNamed(context, SignUpScreen.id);
                },
                radius: 10,
                textColor: primaryColor2),
            const Spacer(
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}
