import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InternshipCard extends StatelessWidget {
  bool isActive;
  String title;
  String company;
  String location;
  String startDate;
  String duration;
  String salary;
  bool isPpo;
  bool isPartTime;
  String postedBy;
  InternshipCard(
      {required this.isActive,
      required this.title,
      required this.company,
      required this.location,
      required this.startDate,
      required this.duration,
      required this.salary,
      required this.isPartTime,
      required this.isPpo,
      required this.postedBy});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(left: width * 0.02, top: height * 0.02),
      child: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Visibility(
              visible: isActive,
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xffE9E9EB),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(6))),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: width * 0.02,
                      right: width * 0.02,
                      top: width * 0.01,
                      bottom: width * 0.01),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      FaIcon(
                        FontAwesomeIcons.chartLine,
                        color: Colors.blue,
                        size: height * 0.018,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: width * 0.01),
                        child: Text(
                          'Actively hiring',
                          style: TextStyle(
                              color: Colors.black, fontSize: height * 0.016),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: height * 0.01),
              child: Text(
                title,
                style: TextStyle(color: Colors.black, fontSize: height * 0.02),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: height * 0.01),
              child: Text(
                company,
                style: TextStyle(color: Colors.grey, fontSize: height * 0.02),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(right: width * 0.01, top: height * 0.011),
                  child: Icon(
                    Icons.location_on_outlined,
                    color: Colors.grey,
                    size: height * 0.022,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: height * 0.01),
                  child: Text(
                    location,
                    style: TextStyle(
                        color: Colors.black, fontSize: height * 0.016),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          right: width * 0.01, top: height * 0.011),
                      child: Icon(
                        Icons.play_circle_outline_sharp,
                        color: Colors.grey,
                        size: height * 0.022,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: height * 0.01),
                      child: Text(
                        startDate,
                        style: TextStyle(
                            color: Colors.black, fontSize: height * 0.016),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: width * 0.1,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          right: width * 0.01, top: height * 0.011),
                      child: Icon(
                        Icons.calendar_today_rounded,
                        color: Colors.grey,
                        size: height * 0.02,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: height * 0.01),
                      child: Text(
                        duration,
                        style: TextStyle(
                            color: Colors.black, fontSize: height * 0.016),
                      ),
                    ),
                  ],
                )
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(right: width * 0.01, top: height * 0.011),
                  child: Icon(
                    Icons.money_outlined,
                    color: Colors.grey,
                    size: height * 0.022,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: height * 0.01),
                  child: Text(
                    salary,
                    style: TextStyle(
                        color: Colors.black, fontSize: height * 0.016),
                  ),
                ),
              ],
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: height * 0.01, bottom: height * 0.014),
              child: Row(
                children: [
                  Visibility(
                    visible: isPpo,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xffE9E9EB),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text('Internship with job offer',
                            style: TextStyle(
                                color: Colors.grey, fontSize: height * 0.016)),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(0xffE9E9EB),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(6))),
              child: Padding(
                padding: EdgeInsets.only(
                    left: width * 0.02,
                    right: width * 0.02,
                    top: width * 0.006,
                    bottom: width * 0.006),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.refresh,
                      color: Colors.blue,
                      size: height * 0.018,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: width * 0.01),
                      child: Text(
                        postedBy,
                        style: TextStyle(
                            color: Colors.black, fontSize: height * 0.016),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: height * 0.01),
              child: Divider(
                color: Color(0xffE9E9EB),
                thickness: 1,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: height * 0.01,
                      bottom: height * 0.01,
                      left: width * 0.046,
                      right: width * 0.046),
                  child: Text('View details',
                      style: TextStyle(
                          color: Colors.blue, fontSize: height * 0.016)),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: height * 0.01,
                      bottom: height * 0.02,
                      left: width * 0.026,
                      right: width * 0.076),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: height * 0.01,
                              bottom: height * 0.01,
                              left: width * 0.046,
                              right: width * 0.046),
                          child: Text('Apply Now',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: height * 0.016)),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
