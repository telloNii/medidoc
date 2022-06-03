import 'package:doctor_app/constants.dart';
import 'package:doctor_app/text_style.dart';
import 'package:doctor_app/ui/screens/authentication/components/sign_up_form.dart';
import 'package:doctor_app/ui/widgets/custom_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:gap/gap.dart';

class ForgotPassword extends StatefulWidget {
  static const String id = "forgot password route";

  const ForgotPassword({Key? key}) : super(key: key);
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  late final TextEditingController _emailTextController;

  @override
  void initState() {
    _emailTextController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.longestSide * 0.8,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Forgot Password",
                style: subHeaderTextStyle.copyWith(fontSize: headline2)),
            const TextFieldName(
              text: "Email",
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(hintText: "test@email.com"),
              validator: EmailValidator(errorText: "Use a valid email!"),
              controller: _emailTextController,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 18.0),
              child: Text(
                "A password reset link will be sent to your email address.",
                textAlign: TextAlign.start,
                style: tagTextStyle,
              ),
            ),
            CustomButton(
              color: primaryColor,
              width: 500,
              label: "Send",
              height: 50,
              onPressed: () async {
                try {
                  await _auth
                      .sendPasswordResetEmail(
                        email: _emailTextController.text,
                      )
                      .then((value) => Navigator.pop(context));
                } catch (error) {
                  Fluttertoast.showToast(msg: "An Error Occurred");
                }
              },
              radius: 10,
              textColor: primaryColor2,
            )
          ],
        ),
      ),
    );
  }
}
