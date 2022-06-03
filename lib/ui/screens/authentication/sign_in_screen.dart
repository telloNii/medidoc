import 'package:doctor_app/text_style.dart';
import 'package:doctor_app/ui/screens/authentication/components/sign_up_form.dart';
import 'package:doctor_app/ui/screens/authentication/forgot_password.dart';
import 'package:doctor_app/ui/screens/authentication/sign_up_screen.dart';
import 'package:doctor_app/ui/screens/navigation/main_navigator.dart';
import 'package:doctor_app/ui/widgets/custom_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:gap/gap.dart';

import '../../../constants.dart';

class SignInScreen extends StatefulWidget {
  static const String id = "sign in screen route";

  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  late final TextEditingController _emailTextController;
  late final TextEditingController _passwordTextController;

  @override
  void initState() {
    super.initState();
    _emailTextController = TextEditingController();
    _passwordTextController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        fit: StackFit.expand,
        children: [
          SvgPicture.asset(
            "assets/icons/Sign_Up_bg.svg",
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          SafeArea(
            child: SingleChildScrollView(
              physics:
                  const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Gap(50),
                  Text(
                    "Sign In",
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  RichText(
                    text: TextSpan(
                      text: "Don't have an account?",
                      style: primaryTextStyle,
                      children: [
                        TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.popAndPushNamed(context, SignUpScreen.id);
                              },
                            text: " Sign Up!",
                            style: primaryTextStyle.copyWith(color: primaryColor1))
                      ],
                    ),
                  ),
                  const SizedBox(height: defaultPadding * 2),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const TextFieldName(text: "Email"),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(hintText: "test@email.com"),
                        validator: EmailValidator(errorText: "Use a valid email!"),
                        controller: _emailTextController,
                      ),
                      const SizedBox(height: defaultPadding),
                      const TextFieldName(text: "Password"),
                      TextFormField(
                        // We want to hide our password
                        obscureText: true,
                        decoration: const InputDecoration(hintText: "******"),
                        validator: passwordValidator,
                        controller: _passwordTextController,
                      ),
                      Padding(
                          padding: const EdgeInsets.only(top: 18.0),
                          child: GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                backgroundColor: const Color(0x00000000),
                                context: context,
                                isScrollControlled: true,
                                builder: (context) => const SingleChildScrollView(
                                  child: ForgotPassword(),
                                ),
                              );
                            },
                            child: const Text(
                              "Forgot password?",
                              textAlign: TextAlign.end,
                              style: tagTextStyle,
                            ),
                          )),
                      const SizedBox(height: defaultPadding),
                    ],
                  ),
                  CustomButton(
                    label: "Sign In",
                    color: primaryColor,
                    width: 500,
                    height: 55,
                    onPressed: () async {
                      try {
                        await _firebaseAuth.signInWithEmailAndPassword(
                            email: _emailTextController.text,
                            password: _passwordTextController.text);
                        if (_firebaseAuth.currentUser != null) {
                          Navigator.popAndPushNamed(context, MainNavigation.id);
                        }
                      } catch (e) {
                        _emailTextController.clear();
                        _passwordTextController.clear();
                        Fluttertoast.showToast(msg: "An Error Occurred");
                      }
                    },
                    radius: 10,
                    textColor: textColor,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
