import 'package:doctor_app/constants.dart';
import 'package:doctor_app/models/colorScheme.dart';
import 'package:doctor_app/ui/screens/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';

class OnBoarding extends StatefulWidget {
  static const String id = "OnBoarding screen route";
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: docBgColor,
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: CustomPaint(
                  painter: PathPainter(),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(50),
                margin: const EdgeInsets.only(top: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const <Widget>[
                    Text(
                      "Doctor's Appointment in 2 Minutes",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      "Finding a doctor was never \nso easy!",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                bottom: MediaQuery.of(context).size.height * 0.3,
                child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Image.asset('assets/images/onboarding.png'),
                    )),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: InkWell(
                  child: Container(
                    height: 80,
                    width: 200,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          stops: [0, 1],
                          colors: [getStartedColorStart, getStartedColorEnd],
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                        )),
                    child: const Center(
                      child: Text(
                        "Get Started",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.popAndPushNamed(context, WelcomeScreen.id);
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class PathPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = primaryColor;
    paint.style = PaintingStyle.fill;
    var path = Path();
    path.moveTo(0, size.height * 0.4);
    path.quadraticBezierTo(
        size.width * 0.35, size.height * 0.40, size.width * 0.58, size.height * 0.6);
    path.quadraticBezierTo(
        size.width * 0.72, size.height * 0.8, size.width * 0.92, size.height * 0.8);
    path.quadraticBezierTo(
        size.width * 0.98, size.height * 0.8, size.width, size.height * 0.82);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
