import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_app/constants.dart';
import 'package:doctor_app/models/user.dart';
import 'package:doctor_app/text_style.dart';
import 'package:doctor_app/ui/screens/authentication/sign_in_screen.dart';
import 'package:doctor_app/ui/screens/profile/settings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ndialog/ndialog.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({
    Key? key,
    // required this.username,
    // required this.profileImageURL,
  }) : super(key: key);
  // final String profileImageURL;
  // final String username;
  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final User _user = FirebaseAuth.instance.currentUser!;
  UserModel? userModel;
  DocumentReference? userRef;
  File? imageFile;
  bool showLocalFile = false;
  _getUserDetails() async {
    DocumentSnapshot snapshot = await userRef!.get();

    userModel = UserModel.fromMap(snapshot.data() as Map<String, dynamic>);
  }

  _pickImageFromGallery() async {
    XFile? xFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (xFile == null) return;

    final tempImage = File(xFile.path);

    imageFile = tempImage;
    showLocalFile = true;
    setState(() {});

    // upload to firebase storage

    ProgressDialog progressDialog = ProgressDialog(
      context,
      title: const Text('Uploading !!!'),
      message: const Text('Please wait'),
    );
    progressDialog.show();
    try {
      var fileName = userModel!.email + '.jpg';

      UploadTask uploadTask = FirebaseStorage.instance
          .ref()
          .child('profile_images')
          .child(fileName)
          .putFile(imageFile!);

      TaskSnapshot snapshot = await uploadTask;

      String profileImageUrl = await snapshot.ref.getDownloadURL();

      print(profileImageUrl);

      progressDialog.dismiss();
    } catch (e) {
      progressDialog.dismiss();

      print(e.toString());
    }
  }

  _pickImageFromCamera() async {
    XFile? xFile = await ImagePicker().pickImage(source: ImageSource.camera);

    if (xFile == null) return;

    final tempImage = File(xFile.path);

    imageFile = tempImage;
    showLocalFile = true;
    setState(() {});
    // upload to firebase storage

    ProgressDialog progressDialog = ProgressDialog(
      context,
      title: const Text('Uploading !!!'),
      message: const Text('Please wait'),
    );
    progressDialog.show();
    try {
      var fileName = _user.uid + '.jpg';

      UploadTask uploadTask = FirebaseStorage.instance
          .ref()
          .child('profile_images')
          .child(fileName)
          .putFile(imageFile!);

      TaskSnapshot snapshot = await uploadTask;

      String profileImageUrl = await snapshot.ref.getDownloadURL();
      FirebaseFirestore.instance.collection('users').doc(_user.uid).set(
        {
          "profileImage": profileImageUrl,
        },
        SetOptions(merge: true),
      );
      print(profileImageUrl);

      progressDialog.dismiss();
    } catch (e) {
      progressDialog.dismiss();
      SnackBar(
        content: Text("An error occured"),
      );
      print(e.toString());
    }
  }

  @override
  void initState() {
    userRef = _firebaseFirestore.collection('users').doc(_user.uid);
    _getUserDetails();

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
                child: Stack(
                  children: [
                    CircleAvatar(
                        radius: 40,
                        backgroundImage: showLocalFile
                            ? FileImage(imageFile!) as ImageProvider
                            : userModel!.profileImage == ''
                                ? const NetworkImage(
                                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQGrQoGh518HulzrSYOTee8UO517D_j6h4AYQ&usqp=CAU')
                                : NetworkImage(userModel!.profileImage)),
                    Positioned(
                      right: 0.0,
                      bottom: 0.0,
                      child: GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      ListTile(
                                        leading: const Icon(Icons.image),
                                        title: const Text('From Gallery'),
                                        onTap: () {
                                          _pickImageFromGallery();
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      ListTile(
                                        leading: const Icon(Icons.camera_alt),
                                        title: const Text('From Camera'),
                                        onTap: () {
                                          _pickImageFromCamera();
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              });
                        },
                        child: const Icon(
                          Icons.camera_alt,
                          color: primaryColor2,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      // _getUserDetails().username,
                      _user.displayName!,
                      style: headerTextStyle.copyWith(
                          fontSize: headline2, color: primaryColor2),
                    ),
                    Text(
                      _user.email!,
                      overflow: TextOverflow.clip,
                      maxLines: 2,
                      softWrap: true,
                      style: primaryTextStyle.copyWith(color: primaryColor2),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView(
            physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
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
                        Navigator.pushNamed(context, ProfileSettings.id);
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
