import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_app/constants.dart';
import 'package:doctor_app/models/user.dart';
import 'package:doctor_app/ui/screens/doctors/doctors.dart';
import 'package:doctor_app/ui/screens/home.dart';
import 'package:doctor_app/ui/screens/notification/notifications.dart';
import 'package:doctor_app/ui/screens/profile/user_profile.dart';
import 'package:doctor_app/ui/widgets/active_tab_indicator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ndialog/ndialog.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({Key? key}) : super(key: key);
  static const String id = "main page route";
  @override
  _MainNavigationState createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int bottomNavBarIndex = 0;
  void newIndex(int index) {
    setState(() {
      bottomNavBarIndex = index;
    });
  }

  List<Widget> pageData = [
    const HomeScreen(),
    const DoctorsScreen(),
    const Notifications(),
    UserProfile(),
  ];
  // final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  // final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  // final User _user = FirebaseAuth.instance.currentUser!;
  // late UserModel userModel;
  // DocumentReference? userRef;
  // File? imageFile;
  // bool showLocalFile = false;
  //
  // _getUserDetails() async {
  //   DocumentSnapshot snapshot = await userRef!.get();
  //
  //   userModel = UserModel.fromMap(snapshot.data() as Map<String, dynamic>);
  //
  //   setState(() {});
  // }
  //
  // _pickImageFromGallery() async {
  //   XFile? xFile = await ImagePicker().pickImage(source: ImageSource.gallery);
  //
  //   if (xFile == null) return;
  //
  //   final tempImage = File(xFile.path);
  //
  //   imageFile = tempImage;
  //   showLocalFile = true;
  //   setState(() {});
  //
  //   // upload to firebase storage
  //
  //   ProgressDialog progressDialog = ProgressDialog(
  //     context,
  //     title: const Text('Uploading !!!'),
  //     message: const Text('Please wait'),
  //   );
  //   progressDialog.show();
  //   try {
  //     var fileName = userModel.email + '.jpg';
  //
  //     UploadTask uploadTask = FirebaseStorage.instance
  //         .ref()
  //         .child('profile_images')
  //         .child(fileName)
  //         .putFile(imageFile!);
  //
  //     TaskSnapshot snapshot = await uploadTask;
  //
  //     String profileImageUrl = await snapshot.ref.getDownloadURL();
  //
  //     print(profileImageUrl);
  //
  //     progressDialog.dismiss();
  //   } catch (e) {
  //     progressDialog.dismiss();
  //
  //     print(e.toString());
  //   }
  // }
  //
  // _pickImageFromCamera() async {
  //   XFile? xFile = await ImagePicker().pickImage(source: ImageSource.camera);
  //
  //   if (xFile == null) return;
  //
  //   final tempImage = File(xFile.path);
  //
  //   imageFile = tempImage;
  //   showLocalFile = true;
  //   setState(() {});
  //   // upload to firebase storage
  //
  //   ProgressDialog progressDialog = ProgressDialog(
  //     context,
  //     title: const Text('Uploading !!!'),
  //     message: const Text('Please wait'),
  //   );
  //   progressDialog.show();
  //   try {
  //     var fileName = _user.uid + '.jpg';
  //
  //     UploadTask uploadTask = FirebaseStorage.instance
  //         .ref()
  //         .child('profile_images')
  //         .child(fileName)
  //         .putFile(imageFile!);
  //
  //     TaskSnapshot snapshot = await uploadTask;
  //
  //     String profileImageUrl = await snapshot.ref.getDownloadURL();
  //     FirebaseFirestore.instance.collection('users').doc(_user.uid).set(
  //       {
  //         "profileImage": profileImageUrl,
  //       },
  //       SetOptions(merge: true),
  //     );
  //     print(profileImageUrl);
  //
  //     progressDialog.dismiss();
  //   } catch (e) {
  //     progressDialog.dismiss();
  //     const SnackBar(
  //       content: Text("An error occured"),
  //     );
  //     print(e.toString());
  //   }
  // }

  @override
  void initState() {
    const UserProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFFFFFFF), Color(0xFFFFFFFF)],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        bottomNavigationBar: Theme(
          data: ThemeData(
            canvasColor: Colors.white,
          ),
          child: BottomNavigationBar(
            elevation: 10,
            type: BottomNavigationBarType.shifting,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: bottomNavBarIndex,
            onTap: newIndex,
            selectedItemColor: primaryColor1,
            unselectedItemColor: primaryTextColor,
            items: [
              BottomNavigationBarItem(
                  icon: bottomNavBarIndex == 0
                      ? const ActiveBottomNavBarTab(
                          margin: EdgeInsets.only(left: 18.0),
                          label: "Home",
                          icon: Icons.home_filled)
                      : const Icon(
                          Icons.home_filled,
                          color: primaryColor,
                          size: headline2,
                        ),
                  label: ""),
              BottomNavigationBarItem(
                  icon: bottomNavBarIndex == 1
                      ? const ActiveBottomNavBarTab(
                          label: "Doctors", icon: Icons.health_and_safety)
                      : const Icon(
                          Icons.health_and_safety,
                          color: primaryColor,
                          size: headline2,
                        ),
                  label: ""),
              BottomNavigationBarItem(
                  icon: bottomNavBarIndex == 2
                      ? const ActiveBottomNavBarTab(
                          label: "Messages", icon: Icons.notifications)
                      : const Icon(
                          Icons.notifications,
                          color: primaryColor,
                          size: headline2,
                        ),
                  label: ""),
              BottomNavigationBarItem(
                  icon: bottomNavBarIndex == 3
                      ? const ActiveBottomNavBarTab(
                          label: "Profile",
                          icon: Icons.person,
                          margin: EdgeInsets.only(right: 18.0),
                        )
                      : const Icon(
                          Icons.person,
                          color: primaryColor,
                          size: headline2,
                        ),
                  label: ""),
            ],
          ),
        ),
        // appBar: appBars.elementAt(bottomNavBarIndex),
        body: IndexedStack(
          index: bottomNavBarIndex,
          children: pageData,
        ),
      ),
    );
  }
}
