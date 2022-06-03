import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_app/constants.dart';
import 'package:doctor_app/text_style.dart';
import 'package:doctor_app/ui/screens/authentication/components/sign_up_form.dart';
import 'package:doctor_app/ui/screens/authentication/sign_in_screen.dart';
import 'package:doctor_app/ui/screens/navigation/main_navigator.dart';
import 'package:doctor_app/ui/widgets/custom_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:gap/gap.dart';

class SignUpScreen extends StatefulWidget {
  static const String id = "sign up screen route";

  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  late final TextEditingController _emailTextController;
  late final TextEditingController _passwordTextController;
  late final TextEditingController _usernameTextController;
  late final TextEditingController _phoneNumberTextController;

  @override
  void initState() {
    super.initState();
    _emailTextController = TextEditingController();
    _passwordTextController = TextEditingController();
    _usernameTextController = TextEditingController();
    _phoneNumberTextController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          SvgPicture.asset(
            "assets/icons/Sign_Up_bg.svg",
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          SafeArea(
            child: SingleChildScrollView(
              physics:
                  const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Gap(60),
                  Text(
                    "Create Account",
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  RichText(
                    text: TextSpan(
                      text: "Already have an account?",
                      style: primaryTextStyle,
                      children: [
                        TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.popAndPushNamed(context, SignInScreen.id);
                              },
                            text: " Sign In!",
                            style: primaryTextStyle.copyWith(color: primaryColor1))
                      ],
                    ),
                  ),
                  const SizedBox(height: defaultPadding * 2),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TextFieldName(text: "Username"),
                      TextFormField(
                        decoration: const InputDecoration(hintText: "MediDoc User"),
                        validator: RequiredValidator(errorText: "Username is required"),
                        // Let's save our username
                        controller: _usernameTextController,
                      ),
                      const SizedBox(height: defaultPadding),
                      const TextFieldName(text: "Email"),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(hintText: "medidoc@email.com"),
                        validator: EmailValidator(errorText: "Use a valid email!"),
                        controller: _emailTextController,
                      ),
                      const SizedBox(height: defaultPadding),
                      const TextFieldName(text: "Phone"),
                      TextFormField(
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(hintText: "+233504331555"),
                        validator:
                            RequiredValidator(errorText: "Phone number is required"),
                        controller: _phoneNumberTextController,
                      ),
                      const SizedBox(height: defaultPadding),
                      const TextFieldName(text: "Password"),
                      TextFormField(
                        obscureText: false,
                        decoration: const InputDecoration(hintText: "******"),
                        validator: passwordValidator,
                        controller: _passwordTextController,
                        // onChanged: (pass) => _passwordTextController.text = pass,
                      ),
                      const SizedBox(height: defaultPadding),
                      const TextFieldName(text: "Confirm Password"),
                      TextFormField(
                        obscureText: false,
                        decoration: const InputDecoration(hintText: "*******"),
                        validator: (pass) =>
                            MatchValidator(errorText: "Password do not  match")
                                .validateMatch(pass!, _passwordTextController.text),
                      ),
                    ],
                  ),
                  const SizedBox(height: defaultPadding * 2),
                  CustomButton(
                    label: "Sign Up",
                    color: primaryColor,
                    width: 500,
                    height: 55,
                    onPressed: () async {
                      try {
                        await _firebaseAuth
                            .createUserWithEmailAndPassword(
                                email: _emailTextController.text,
                                password: _passwordTextController.text)
                            .then((value) async {
                          CollectionReference ref =
                              _firebaseFirestore.collection('users');
                          User _firebaseUser = _firebaseAuth.currentUser!;
                          _firebaseUser.updateDisplayName(_usernameTextController.text);
                          _firebaseUser.updatePhotoURL(
                              "https://png.pngitem.com/pimgs/s/111-1114675_user-login-person-man-enter-person-login-icon.png");
                          await ref.doc(_firebaseUser.uid.toString()).set({
                            'email': _firebaseUser.email,
                            'userName': _usernameTextController.text,
                            'uid': _firebaseUser.uid,
                            'image':
                                "https://png.pngitem.com/pimgs/s/111-1114675_user-login-person-man-enter-person-login-icon.png",
                          });
                        }).then((value) =>
                                Navigator.popAndPushNamed(context, MainNavigation.id));
                      } catch (e) {
                        Fluttertoast.showToast(
                          msg: "An Error Occurred",
                          backgroundColor: secondaryColor1,
                          gravity: ToastGravity.TOP,
                        );
                      }
                    },
                    radius: 10,
                    textColor: primaryColor2,
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
