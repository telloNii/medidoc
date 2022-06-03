import 'package:carousel_slider/carousel_slider.dart';
import 'package:doctor_app/models/doctors.dart';
import 'package:doctor_app/ui/widgets/custom_carousel_card.dart';
import 'package:flutter/material.dart';

class CustomCarousel extends StatefulWidget {
  const CustomCarousel({Key? key}) : super(key: key);

  @override
  _CustomCarouselState createState() => _CustomCarouselState();
}

class _CustomCarouselState extends State<CustomCarousel> {
  final CarouselController _controller = CarouselController();

  int _current = 0;
  List<Widget>? specialistCardWidgetList() {
    List<Widget> specialistsCards = [];

    for (Doctors doctor in doctorsList) {
      final int id = doctor.id;
      final String firstName = doctor.firstName;
      final String lastName = doctor.lastname;
      final String? otherNames = doctor.otherNames;
      final String images = doctor.image;
      final String specialty = doctor.specialty;
      final int experience = doctor.experience;
      final int patientCount = doctor.patientCount;
      final double ratings = doctor.ratings;
      final String institution = doctor.institution;
      specialistsCards.add(
        SpecialistCarouselCard(
          id: id,
          firstName: firstName,
          lastName: lastName,
          otherNames: otherNames,
          images: images,
          specialty: specialty,
          experience: experience,
          patientCount: patientCount,
          ratings: ratings,
          institution: institution,
        ),
      );
    }
    return specialistsCards;
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: specialistCardWidgetList(),
      options: CarouselOptions(
          initialPage: _current,
          enlargeCenterPage: true,
          viewportFraction: 0.85,
          aspectRatio: 18 / 9,
          autoPlay: true,
          onPageChanged: (index, reason) {
            setState(() {
              _current = index;
            });
          }),
      carouselController: _controller,
    );
  }
}

class AvailableDoctorCarousel extends StatefulWidget {
  const AvailableDoctorCarousel({Key? key}) : super(key: key);

  @override
  State<AvailableDoctorCarousel> createState() => _AvailableDoctorCarouselState();
}

class _AvailableDoctorCarouselState extends State<AvailableDoctorCarousel> {
  final CarouselController _controller = CarouselController();

  int _current = 0;
  List<Widget>? availableCardWidgetList() {
    List<Widget> availableDoctorsCards = [];

    for (Doctors doctor in doctorsList) {
      final int id = doctor.id;
      final String firstName = doctor.firstName;
      final String lastName = doctor.lastname;
      final String? otherNames = doctor.otherNames;
      final String images = doctor.image;
      final String specialty = doctor.specialty;
      final int experience = doctor.experience;
      final int patientCount = doctor.patientCount;
      final double ratings = doctor.ratings;
      final String institution = doctor.institution;
      availableDoctorsCards.add(
        AvailableDoctorsCarouselCard(
          id: id,
          firstName: firstName,
          lastName: lastName,
          otherNames: otherNames,
          images: images,
          specialty: specialty,
          experience: experience,
          patientCount: patientCount,
          ratings: ratings,
          institution: institution,
        ),
      );
    }
    return availableDoctorsCards;
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: availableCardWidgetList(),
      options: CarouselOptions(
          initialPage: _current,
          pageSnapping: true,
          enlargeCenterPage: false,
          padEnds: false,
          viewportFraction: 0.6,
          aspectRatio: 18 / 9,
          autoPlay: true,
          onPageChanged: (index, reason) {
            setState(() {
              _current = index;
            });
          }),
      carouselController: _controller,
    );
  }
}
