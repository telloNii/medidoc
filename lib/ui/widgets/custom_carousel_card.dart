import 'package:doctor_app/constants.dart';
import 'package:doctor_app/models/doctors.dart';
import 'package:doctor_app/text_style.dart';
import 'package:doctor_app/ui/screens/doctors/doctor_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gap/gap.dart';

class SpecialistCarouselCard extends StatefulWidget {
  const SpecialistCarouselCard({
    Key? key,
    // this.index,
    required final int id,
    required final String firstName,
    required final String lastName,
    final String? otherNames,
    required final String images,
    required final String specialty,
    required int experience,
    required int patientCount,
    required double ratings,
    required final String institution,
  })  : _id = id,
        _firstName = firstName,
        _lastName = lastName,
        _otherNames = otherNames,
        _images = images,
        _specialty = specialty,
        _experience = experience,
        _patientCount = patientCount,
        _ratings = ratings,
        _institution = institution,
        super(key: key);
  // final int? _index;
  final int _id;
  final String _firstName;
  final String _lastName;
  final String? _otherNames;
  final String _images;
  final String _specialty;
  final int _experience;
  final int _patientCount;
  final double _ratings;
  final String _institution;

  @override
  State<SpecialistCarouselCard> createState() => _SpecialistCarouselCardState();
}

class _SpecialistCarouselCardState extends State<SpecialistCarouselCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 18.0),
        width: double.infinity,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Looking For You Desire\nSpecialist Doctor?",
                    style: cardHeadersTextStyle.copyWith(color: primaryColor2),
                  ),
                  const Gap(20),
                  Text(
                    "Dr. ${widget._firstName} ${widget._lastName}",
                    style: tagTextStyle.copyWith(
                        color: primaryColor2, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    widget._specialty,
                    style: tagTextStyle.copyWith(color: discountCardColor),
                  ),
                  Text(
                    widget._institution,
                    style: tagTextStyle.copyWith(color: discountCardColor),
                  ),
                ],
              ),
              Expanded(child: Image.asset(widget._images))
            ],
          ),
        ),
      ),
    );
  }
}

class AvailableDoctorsCarouselCard extends StatefulWidget {
  const AvailableDoctorsCarouselCard({
    Key? key,
    required final int id,
    required final String firstName,
    required final String lastName,
    final String? otherNames,
    required final String images,
    required final String specialty,
    required int experience,
    required int patientCount,
    required double ratings,
    required final String institution,
  })  : _id = id,
        _firstName = firstName,
        _lastName = lastName,
        _otherNames = otherNames,
        _images = images,
        _specialty = specialty,
        _experience = experience,
        _patientCount = patientCount,
        _ratings = ratings,
        _institution = institution,
        super(key: key);
  // final int? _index;
  final int _id;
  final String _firstName;
  final String _lastName;
  final String? _otherNames;
  final String _images;
  final String _specialty;
  final int _experience;
  final int _patientCount;
  final double _ratings;
  final String _institution;

  @override
  State<AvailableDoctorsCarouselCard> createState() =>
      _AvailableDoctorsCarouselCardState();
}

class _AvailableDoctorsCarouselCardState extends State<AvailableDoctorsCarouselCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(18.0, 0.0, 0.0, 8.0),
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(20),
        color: primaryColor2,
        child: Container(
            margin: const EdgeInsets.only(left: 18.0),
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: primaryColor2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Dr. ${widget._firstName} ${widget._lastName}",
                      style: inputTextStyle.copyWith(fontWeight: FontWeight.w700),
                    ),
                    Text(
                      widget._specialty,
                      style: tagTextStyle,
                    ),
                    Text(
                      widget._specialty,
                      style: tagTextStyle,
                    ),
                    RatingBar.builder(
                      itemSize: 10,
                      initialRating: widget._ratings,
                      minRating: 0,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (BuildContext context, int index) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {},
                    ),
                    const Gap(10),
                    const Text("Experience"),
                    Text("${widget._experience} Years"),
                    const Gap(10),
                    const Text("Patients"),
                    Text(widget._patientCount.toString()),
                  ],
                ),
                Expanded(
                  flex: 2,
                  child: Image.asset(
                    widget._images,
                    height: 200,
                    width: 200,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

class DoctorsPageCard extends StatefulWidget {
  const DoctorsPageCard({
    Key? key,
    required final int index,
    required final int id,
    required final String firstName,
    required final String lastName,
    final String? otherNames,
    required final String images,
    required final String specialty,
    required int experience,
    required int patientCount,
    required double ratings,
    required final String institution,
  })  : _index = index,
        _id = id,
        _firstName = firstName,
        _lastName = lastName,
        _otherNames = otherNames,
        _images = images,
        _specialty = specialty,
        _experience = experience,
        _patientCount = patientCount,
        _ratings = ratings,
        _institution = institution,
        super(key: key);
  final int _index;
  final int _id;
  final String _firstName;
  final String _lastName;
  final String? _otherNames;
  final String _images;
  final String _specialty;
  final int _experience;
  final int _patientCount;
  final double _ratings;
  final String _institution;

  @override
  State<DoctorsPageCard> createState() => _DoctorsPageCardState();
}

class _DoctorsPageCardState extends State<DoctorsPageCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, DoctorProfile.id);
      },
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(20),
        color: primaryColor2,
        child: Container(
            margin: const EdgeInsets.only(left: 0.0),
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: primaryColor2),
            child: Stack(
              alignment: AlignmentDirectional.centerEnd,
              children: [
                Image.asset(
                  widget._images,
                  fit: BoxFit.fitHeight,
                  width: 100,
                  height: 200,
                ),
                Positioned(
                  width: 115,
                  left: 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Dr. ${widget._firstName} ${widget._lastName}",
                        style: inputTextStyle.copyWith(fontWeight: FontWeight.w700),
                      ),
                      Text(
                        widget._specialty,
                        style: tagTextStyle,
                      ),
                      RatingBar.builder(
                        itemSize: 10,
                        initialRating: widget._ratings,
                        minRating: 0,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (BuildContext context, int index) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {},
                      ),
                      const Gap(10),
                      const Text("Experience"),
                      Text("${widget._experience} Years"),
                      const Gap(10),
                      const Text("Patients"),
                      Text(widget._patientCount.toString()),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
