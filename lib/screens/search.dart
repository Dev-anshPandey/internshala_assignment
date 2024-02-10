import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:internshala/provider/contraints.dart';
import 'package:internshala/widgets/internship_card.dart';
import 'package:provider/provider.dart';

int _totalInternship = 0;

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  Future apigetInternship() async {
    final constraintsProvider =
        Provider.of<ConstraintsProvider>(context, listen: false);
    constraintsProvider.internships.clear();
    Dio dio = Dio();
    const url = "https://internshala.com/flutter_hiring/search";
    Response response = await dio.request(
      url,
      options: Options(
        method: 'GET',
      ),
    );
    Map _tempMap = jsonDecode(response.data);
    List internship_id = _tempMap['internship_ids'];
    for (var x in internship_id) {
    
      try {
        constraintsProvider.internships.add(InternshipCard(
            isActive: _tempMap['internships_meta']["$x"]['is_active'] ?? true,
            title: _tempMap['internships_meta']["$x"]['title'] ?? "",
            company: _tempMap['internships_meta']["$x"]['company_name'] ?? "",
            location:
                _tempMap['internships_meta']["$x"]['location_names'][0] ?? "",
            startDate: _tempMap['internships_meta']["$x"]
                    ['start_date_comparison_format'] ??
                "",
            duration: _tempMap['internships_meta']["$x"]['duration'] ?? "",
            salary:
                _tempMap['internships_meta']["$x"]['stipend']['salary'] ?? "",
            isPartTime: _tempMap['internships_meta']["$x"]['part_time'] ?? "",
            isPpo: _tempMap['internships_meta']["$x"]['is_ppo'] ?? "",
            postedBy:
                _tempMap['internships_meta']["$x"]['posted_by_label'] ?? ""));
      } catch (e) {
        print(e);
      }
    }
    // constraintsProvider.internships
    //     .addAll(constraintsProvider.internships);

    _totalInternship = _tempMap['internships_meta'].length;
    setState(() {});
  }

  @override
  void initState() {
    apigetInternship();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Consumer<ConstraintsProvider>(
      builder: (context, value, child) {
        final constraintsProvider =
            Provider.of<ConstraintsProvider>(context, listen: false);
        return Scaffold(
          resizeToAvoidBottomInset: true,
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: EdgeInsets.only(top: height * 0.02, left: width * 0.02),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.arrow_back,
                        color: Colors.grey,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: width * 0.03, top: height * 0.03),
                        child: Container(
                            height: height * 0.086,
                            width: width * 0.88,
                            child: TextFormField(
                              decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.only(bottom: width * 0.0),
                                  hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w400),
                                  hintText:
                                      "Category , location or company name"),
                            )),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () => Navigator.pushNamed(context, '/filter'),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.blue,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: width * 0.02,
                            right: width * 0.02,
                            top: width * 0.01,
                            bottom: width * 0.01),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // FaIcon(
                            //   FontAwesomeIcons.filter,
                            //   color: Colors.blue,
                            //   size: height * 0.018,
                            // ),
                            Icon(
                              Icons.filter_alt_outlined,
                              color: Colors.blue,
                              size: height * 0.018,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: width * 0.01),
                              child: Text(
                                'Filters',
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: height * 0.016),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: width * 0.01,
                        top: height * 0.01,
                        bottom: height * 0.01),
                    child: Text(
                      '${constraintsProvider.count()} ${constraintsProvider.count() > 1 ? "total internships" : "total internship"} ',
                      style: TextStyle(
                          color: Colors.grey, fontSize: height * 0.014),
                    ),
                  ),
                  Divider(
                    color: Color(0xffE9E9EB),
                    thickness: 2,
                  ),
                  Container(
                    height: height * 0.74,
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return Visibility(
                          visible: ((constraintsProvider
                                      .profileConstraints.isNotEmpty
                                  ? constraintsProvider.profileConstraints
                                          .indexWhere(
                                        (element) =>
                                            element.name ==
                                            constraintsProvider
                                                .internships[index].title,
                                      ) >=
                                      0
                                  : true) &&
                              ((constraintsProvider.cityConstraints.isNotEmpty
                                      ? constraintsProvider.cityConstraints
                                              .indexWhere(
                                            (element) =>
                                                element.name ==
                                                constraintsProvider
                                                    .internships[index]
                                                    .location,
                                          ) >=
                                          0
                                      : true) &&
                                  (constraintsProvider.duration != "none"
                                      ? int.parse(constraintsProvider
                                              .internships[index].duration
                                              .substring(0, 1)) <=
                                          int.parse(
                                              constraintsProvider.duration)
                                      : true))),
                          child: Column(
                            children: [
                              constraintsProvider.internships[index],
                              Container(
                                width: double.infinity,
                                height: height * 0.01,
                                decoration: BoxDecoration(
                                    color: Color(0xffE9E9EB),
                                    border:
                                        Border.all(color: Color(0xffE9E9EB))),
                              )
                            ],
                          ),
                        );
                      },
                      itemCount: constraintsProvider.internships.length,
                    ),
                  )
                  // InternshipCard()
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

