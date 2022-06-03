import 'package:doctor_app/constants.dart';
import 'package:doctor_app/text_style.dart';
import 'package:doctor_app/ui/widgets/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gap/gap.dart';

class DoctorProfile extends StatefulWidget {
  const DoctorProfile({Key? key}) : super(key: key);
  static const String id = "doctor's profile page route";

  @override
  State<DoctorProfile> createState() => _DoctorProfileState();
}

class _DoctorProfileState extends State<DoctorProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor2,
      appBar: AppBar(
        backgroundColor: primaryColor2,
        elevation: 0.1,
        title: Text(
          "Dr. Zennita Yeboah",
          style: headerTextStyle.copyWith(fontSize: headline3),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset("assets/images/doctor_big_preview.png"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomButton(
                    color: primaryColor1,
                    width: 110,
                    height: 40,
                    onPressed: () {},
                    radius: 10,
                    textColor: primaryColor2,
                    customLabel: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          Icons.call,
                          color: primaryColor2,
                          size: headline4,
                        ),
                        Text(
                          "Voice Call",
                          style: buttonTextStyle.copyWith(
                              fontSize: buttonSM, color: primaryColor2),
                        ),
                      ],
                    ),
                  ),
                  CustomButton(
                    color: secondaryColor1,
                    width: 110,
                    height: 40,
                    onPressed: () {},
                    radius: 10,
                    textColor: primaryColor2,
                    customLabel: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          Icons.video_call_sharp,
                          color: primaryColor2,
                          size: headline4,
                        ),
                        Text(
                          "Video Call",
                          style: buttonTextStyle.copyWith(
                              fontSize: buttonSM, color: primaryColor2),
                        ),
                      ],
                    ),
                  ),
                  CustomButton(
                    color: primaryColor,
                    width: 110,
                    height: 40,
                    onPressed: () {},
                    radius: 10,
                    textColor: primaryColor2,
                    customLabel: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          CupertinoIcons.chat_bubble_text_fill,
                          color: primaryColor2,
                          size: headline4,
                        ),
                        Text(
                          "Message",
                          style: buttonTextStyle.copyWith(
                              fontSize: buttonSM, color: primaryColor2),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Gap(10),
              Text(
                "Gynaecologist",
                style: headerTextStyle.copyWith(fontSize: headline2),
              ),
              const Text(
                "Akcess Medical Clinic, North Legon, Accra",
                style: subHeaderTextStyle,
              ),
              RatingBar.builder(
                itemSize: 20,
                initialRating: 4.5,
                minRating: 0,
                direction: Axis.horizontal,
                allowHalfRating: true,
                ignoreGestures: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (BuildContext context, int index) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {},
              ),
              const Gap(20),
              Text(
                "About Zennita",
                style: headerTextStyle.copyWith(fontSize: headline3),
              ),
              Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum"),
              const Gap(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Patients",
                        style: subHeaderTextStyle.copyWith(fontSize: headline6),
                      ),
                      Text(
                        "538",
                        style: headerTextStyle.copyWith(fontSize: headline3),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Experience",
                        style: subHeaderTextStyle.copyWith(fontSize: headline6),
                      ),
                      Text(
                        "5 Years",
                        style: headerTextStyle.copyWith(fontSize: headline3),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Review",
                        style: subHeaderTextStyle.copyWith(fontSize: headline6),
                      ),
                      Text(
                        "1300",
                        style: headerTextStyle.copyWith(fontSize: headline3),
                      )
                    ],
                  )
                ],
              ),
              const Gap(20),
              CustomButton(
                color: primaryColor,
                width: 500,
                height: 60,
                onPressed: () {},
                radius: 10,
                textColor: buttonTextColor,
                label: "Book an Appointment",
              )
            ],
          ),
        ),
      ),
    );
  }
}
