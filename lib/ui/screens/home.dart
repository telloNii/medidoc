import 'package:doctor_app/constants.dart';
import 'package:doctor_app/models/colorScheme.dart';
import 'package:doctor_app/text_style.dart';
import 'package:doctor_app/ui/widgets/carousel.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatefulWidget {
  static const String id = "home screen route";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Find Your",
                          style: subHeaderTextStyle,
                        ),
                        Text(
                          "Specialist",
                          style: headerTextStyle.copyWith(fontSize: headline2),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const CustomCarousel(),
              // Padding(
              //   padding: const EdgeInsets.all(18.0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: const [
              //       Text(
              //         "Categories",
              //         style: fieldHeaderTextStyle,
              //       ),
              //       Text(
              //         "See All",
              //         style: fieldHeaderTextStyle,
              //       )
              //     ],
              //   ),
              // ),
              //
              // const SizedBox(
              //   height: 20,
              // ),
              // Container(
              //   width: MediaQuery.of(context).size.width,
              //   height: 120,
              //   margin: const EdgeInsets.only(top: 10),
              //   child: ListView(
              //     physics: const BouncingScrollPhysics(),
              //     scrollDirection: Axis.horizontal,
              //     children: <Widget>[
              //       categoryContainer("category7.png", "CT-Scan"),
              //       categoryContainer("category1.png", "Ortho"),
              //       categoryContainer("category2.png", "Dietician"),
              //       categoryContainer("category3.png", "Physician"),
              //       categoryContainer("category4.png", "Paralysis"),
              //       categoryContainer("category5.png", "Cardiology"),
              //       categoryContainer("category6.png", "MRI - Scan"),
              //       categoryContainer("category8.png", "Gynaecology"),
              //     ],
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Available Doctors",
                      style: fieldHeaderTextStyle,
                    ),
                    Text(
                      "See All",
                      style: fieldHeaderTextStyle,
                    ),
                  ],
                ),
              ),

              const AvailableDoctorCarousel(),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.0),
                child: Text(
                  "Available Doctors",
                  style: fieldHeaderTextStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    createDocWidget("assets/images/search_doc_1.png", "Kiran Nelson"),
                    createDocWidget("assets/images/search_doc_2.png", "Gina Asare"),
                    createDocWidget("assets/images/search_doc_3.png", "John Edoo"),
                    createDocWidget("assets/images/search_doc_4.png", "Salina Zaman"),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  SizedBox categoryContainer(String imgName, String title) {
    return SizedBox(
      width: 130,
      child: Column(
        children: <Widget>[
          Image.asset('assets/images/category/$imgName'),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 17),
          )
        ],
      ),
    );
  }

  InkWell createDocWidget(String imgName, String docName) {
    return InkWell(
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
          color: docContentBgColor,
        ),
        child: Container(
          padding: const EdgeInsets.all(7),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Container(
                width: 70,
                height: 90,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(imgName.toString()), fit: BoxFit.cover)),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Dr. $docName",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const SizedBox(
                    width: 250,
                    height: 50,
                    child: Text(
                      "A brief about the doctor to be added here. This is more like an introduction about the doctor",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                      overflow: TextOverflow.clip,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
      onTap: openDocInfo,
    );
  }

  void openDocInfo() {
    Navigator.pushNamed(context, '/DocInfoPage');
  }
}

mixin pathPainter implements CustomPainter {
  Color? get path2Color => null;

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = path2Color!;

    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width * 0.3, 0);
    path.quadraticBezierTo(
        size.width * 0.5, size.height * 0.03, size.width * 0.42, size.height * 0.17);
    path.quadraticBezierTo(size.width * 0.35, size.height * 0.32, 0, size.height * 0.29);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
