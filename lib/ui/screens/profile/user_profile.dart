import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_app/constants.dart';
import 'package:doctor_app/text_style.dart';
import 'package:doctor_app/ui/screens/authentication/sign_in_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final User _user = FirebaseAuth.instance.currentUser!;

  @override
  void initState() {
    _user.updateDisplayName("Tello Nii");

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 8.0, top: 50.0),
          height: MediaQuery.of(context).size.height * 0.25,
          decoration: const BoxDecoration(
            color: primaryColor1,
            image: DecorationImage(
                image: AssetImage("assets/images/blue_bg.jpg"), fit: BoxFit.fill),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 35,
                  backgroundImage: NetworkImage(_user.photoURL!),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _user.displayName!,
                      style: headerTextStyle.copyWith(fontSize: headline2),
                    ),
                    Text(
                      _user.email!,
                      overflow: TextOverflow.clip,
                      maxLines: 2,
                      softWrap: true,
                      style: primaryTextStyle.copyWith(color: headerTextColor),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Column(
                children: [
                  Card(
                    child: ListTile(
                      onTap: () async {
                        await _firebaseAuth.signOut().then((value) =>
                            Navigator.popAndPushNamed(context, SignInScreen.id));
                      },
                      leading: const Icon(
                        Icons.logout,
                      ),
                      title: const Text("Sign Out"),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      onTap: () {
                        // Navigator.pushNamed(context, Settings.id);
                      },
                      leading: const Icon(Icons.settings),
                      title: const Text("Settings"),
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(left: 16.0, top: 8.0),
                child: Text(
                  "General",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                ),
              ),
              Column(
                children: const [
                  Card(
                    child: ListTile(
                      leading: Icon(Icons.language_sharp),
                      title: Text("Language"),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: Icon(Icons.info_outlined),
                      title: Text("About"),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: Icon(Icons.rule_rounded),
                      title: Text("Terms of Service"),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: Icon(Icons.privacy_tip),
                      title: Text("Privacy Policy"),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: Icon(Icons.support),
                      title: Text("Support"),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
