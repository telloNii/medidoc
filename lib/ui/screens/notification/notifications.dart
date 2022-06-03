import 'package:doctor_app/constants.dart';
import 'package:doctor_app/text_style.dart';
import 'package:flutter/material.dart';

class Notifications extends StatelessWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor2,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        slivers: [
          SliverAppBar(
            title: Text(
              "Notifications",
              style: headerTextStyle.copyWith(fontSize: headline3),
            ),
            backgroundColor: const Color(0xFFFFFFFF),
            floating: true,
            elevation: 0.2,
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 8.0),
            sliver: SliverToBoxAdapter(
              child: Container(
                  color: const Color(0xFFFFFFFF),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30.0, top: 18.0),
                    child: Text(
                      "Today",
                      style: headerTextStyle.copyWith(fontSize: headline5),
                    ),
                  )),
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 100,
            delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
              return Container(
                color: const Color(0xFFFFFFFF),
                padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 18.0),
                child: ListTile(
                  isThreeLine: true,
                  leading: Container(
                    height: 40.0,
                    width: 40.0,
                    decoration: BoxDecoration(
                        color: primaryColor1, borderRadius: BorderRadius.circular(10)),
                    child: const Icon(
                      Icons.notifications_outlined,
                      color: primaryColor2,
                    ),
                  ),
                  title: Text(
                    "Upcoming Appointment",
                    style: headerTextStyle.copyWith(fontSize: headline5),
                  ),
                  subtitle: Text(
                    "You have an upcoming appointment with Dr. Zennita On Thursday 2nd June, 2022 - 2:00PM GMT, at Akcess Medical Center, North Legon",
                    style: primaryTextStyle.copyWith(
                        color: subHeaderTextColor, fontSize: headline6),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  trailing: const Text("31 May"),
                ),
              );
            }, childCount: 3),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 8.0),
            sliver: SliverToBoxAdapter(
              child: Container(
                  color: const Color(0xFFFFFFFF),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30.0, top: 18.0),
                    child: Text(
                      "Yesterday",
                      style: headerTextStyle.copyWith(fontSize: headline5),
                    ),
                  )),
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 100,
            delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
              return Container(
                color: const Color(0xFFFFFFFF),
                padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 18.0),
                child: ListTile(
                  isThreeLine: true,
                  leading: Container(
                    height: 40.0,
                    width: 40.0,
                    decoration: BoxDecoration(
                        color: secondaryColor1, borderRadius: BorderRadius.circular(10)),
                    child: const Icon(
                      Icons.notifications_outlined,
                      color: primaryColor2,
                    ),
                  ),
                  title: Text(
                    "Upcoming Appointment",
                    style: headerTextStyle.copyWith(fontSize: headline5),
                  ),
                  subtitle: Text(
                    "You have an upcoming appointment with Dr. Zennita On Thursday 2nd June, 2022 - 2:00PM GMT, at Akcess Medical Center, North Legon",
                    style: primaryTextStyle.copyWith(
                        color: subHeaderTextColor, fontSize: headline6),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  trailing: const Text("30 May"),
                ),
              );
            }, childCount: 3),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 8.0),
            sliver: SliverToBoxAdapter(
              child: Container(
                  color: const Color(0xFFFFFFFF),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30.0, top: 18.0),
                    child: Text(
                      "2 Days",
                      style: headerTextStyle.copyWith(fontSize: headline5),
                    ),
                  )),
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 100,
            delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
              return Container(
                color: const Color(0xFFFFFFFF),
                padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 18.0),
                child: ListTile(
                  isThreeLine: true,
                  leading: Container(
                    height: 40.0,
                    width: 40.0,
                    decoration: BoxDecoration(
                        color: primaryColor1, borderRadius: BorderRadius.circular(10)),
                    child: const Icon(
                      Icons.notifications_outlined,
                      color: primaryColor2,
                    ),
                  ),
                  title: Text(
                    "Upcoming Appointment",
                    style: headerTextStyle.copyWith(fontSize: headline5),
                  ),
                  subtitle: Text(
                    "You have an upcoming appointment with Dr. Zennita On Thursday 2nd June, 2022 - 2:00PM GMT, at Akcess Medical Center, North Legon",
                    style: primaryTextStyle.copyWith(
                        color: subHeaderTextColor, fontSize: headline6),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  trailing: const Text("29 May"),
                ),
              );
            }, childCount: 3),
          ),
        ],
      ),
    );
  }
}
