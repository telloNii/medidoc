import 'package:cloud_firestore/cloud_firestore.dart';

class Doctors {
  Doctors(
      {required this.id,
      required this.firstName,
      required this.lastname,
      this.otherNames,
      required this.image,
      required this.specialty,
      required this.experience,
      required this.patientCount,
      required this.ratings,
      required this.institution});
  late final String firstName;
  late final String lastname;
  late final String? otherNames;
  late final String specialty;
  late final int experience;
  late final int patientCount;
  late final int id;
  late final double ratings;
  late final String image;
  late final String institution;

  factory Doctors.fromDocument(DocumentSnapshot<Map<String, dynamic>> docs) {
    return Doctors(
      id: docs.data()!["id"],
      firstName: docs.data()!["first_name"],
      lastname: docs.data()!["last_name"],
      image: docs.data()!['image'],
      specialty: docs.data()!['specialty'],
      experience: docs.data()!['experience'],
      patientCount: docs.data()!['patientCount'],
      ratings: docs.data()!['ratings'],
      institution: docs.data()!["institution"],
    );
  }
}

List<Doctors> doctorsList = [
  Doctors(
    id: 10001001,
    firstName: "Todd ",
    lastname: "Nelson",
    image: "assets/images/Kwame_Khan.png",
    specialty: "Neurosurgeon",
    experience: 8,
    patientCount: 312,
    ratings: 4.5,
    institution: "North Legon Clinic",
  ),
  Doctors(
    id: 10001002,
    firstName: "Zennita ",
    lastname: "Yeboah",
    otherNames: "Maame",
    image: "assets/images/John_Edoo.png",
    specialty: "Dentist",
    experience: 8,
    patientCount: 11,
    ratings: 4.5,
    institution: "University of Ghana Hospital",
  ),
  Doctors(
    id: 10001003,
    firstName: "Francis Echesi",
    lastname: "Echesi",
    image: "assets/images/Masu_Awudu.png",
    specialty: "Cardiologist",
    experience: 8,
    patientCount: 25,
    ratings: 4.5,
    institution: "Ridge Hospital",
  ),
  Doctors(
    id: 10001004,
    firstName: "Max-Ryan  ",
    lastname: "Gyekyi",
    image: "assets/images/Salina_Zaman.png",
    specialty: "Neurosurgeon",
    experience: 8,
    patientCount: 42,
    ratings: 4.5,
    institution: "Korle Bu Teaching Hospital",
  ),
  Doctors(
    id: 10001005,
    firstName: "Nana ",
    lastname: "Wiah",
    otherNames: "Osei Kweku",
    image: "assets/images/Kwame_Khan.png",
    specialty: "Psychologist",
    experience: 8,
    patientCount: 112,
    ratings: 4.5,
    institution: "Akcess Health Centre",
  ),
  Doctors(
    id: 10001006,
    firstName: "Innocent",
    lastname: "Atim",
    image: "assets/images/Kwame_Khan.png",
    specialty: "Gynecologist",
    experience: 8,
    patientCount: 81,
    ratings: 4.5,
    institution: "Chiropractic and Wellness Centre",
  ),
  Doctors(
    id: 10001007,
    firstName: "Jephta",
    lastname: "Amakye",
    image: "assets/images/Kwame_Khan.png",
    specialty: "Pediatrician",
    experience: 8,
    patientCount: 51,
    ratings: 4.5,
    institution: "North Legon Hospital",
  ),
  Doctors(
    id: 10001008,
    firstName: "Samuel",
    lastname: "Dzilah",
    image: "assets/images/Kwame_Khan.png",
    specialty: "Cardiologist",
    experience: 8,
    patientCount: 35,
    ratings: 4.5,
    institution: "University of Ghana Clinic",
  ),
  Doctors(
    id: 10001009,
    firstName: "Godfred",
    lastname: "Appiah",
    image: "assets/images/Kwame_Khan.png",
    specialty: "Neurosurgeon",
    experience: 8,
    patientCount: 91,
    ratings: 4.5,
    institution: "University of Ghana Medical Centre",
  ),
];
