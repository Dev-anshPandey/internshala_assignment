import 'package:flutter/material.dart';
import 'package:internshala/provider/contraints.dart';
import 'package:internshala/screens/city.dart';
import 'package:internshala/widgets/choose_city.dart';
import 'package:internshala/widgets/choose_profile.dart';
import 'package:internshala/widgets/selected_constraints.dart';
import 'package:provider/provider.dart';

List<ConstraintContainerProfile> profiles = [];

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
   if(profiles.length==0){
     profiles.clear();
    profiles.addAll([
      ConstraintContainerProfile(
          id: DateTime.now().millisecondsSinceEpoch * 1,
          name: "Data Science Intern"),
      ConstraintContainerProfile(
          id: DateTime.now().millisecondsSinceEpoch * 2,
          name: "Business Analytics Intern"),
      ConstraintContainerProfile(
          id: DateTime.now().millisecondsSinceEpoch * 3,
          name: "Administration Intern"),
      ConstraintContainerProfile(
          id: DateTime.now().millisecondsSinceEpoch * 4,
          name: "Brand Management Intern"),
      ConstraintContainerProfile(
          id: DateTime.now().millisecondsSinceEpoch * 5,
          name: "Android App Development Intern"),
      ConstraintContainerProfile(
          id: DateTime.now().millisecondsSinceEpoch * 6,
          name: "Product Management Intern"),
    ]);
   }
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Consumer<ConstraintsProvider>(
          builder: (context, value, child) {
            final constraintsProvider =
                Provider.of<ConstraintsProvider>(context, listen: false);
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding:
                    EdgeInsets.only(top: height * 0.06, left: width * 0.04),
                child: Column(
                  children: [
                    Row(
                      children: [
                        InkWell(
                            onTap: () => Navigator.pop(context),
                            child: Icon(Icons.arrow_back)),
                        Padding(
                          padding: EdgeInsets.only(left: width * 0.02),
                          child: Text(
                            'Profile',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: height * 0.024),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: width * 0.1),
                          child: InkWell(
                            onTap: () {
                              constraintsProvider.clearAllProfile();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.white,
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: height * 0.01,
                                    bottom: height * 0.01,
                                    left: width * 0.06,
                                    right: width * 0.06),
                                child: Text('Clear All',
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: height * 0.016)),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: height * 0.008,
                              bottom: height * 0.008,
                              left: width * 0.03,
                              right: width * 0.02),
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.blue,
                                  ),
                                  color: Colors.blue,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: height * 0.01,
                                    bottom: height * 0.01,
                                    left: width * 0.08,
                                    right: width * 0.08),
                                child: Text('Apply ',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: height * 0.016)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: height * 0.036,
                          right: width * 0.06,
                          bottom: height * 0.02),
                      child: Container(
                        height: height * 0.056,
                        child: TextField(
                          decoration: InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              label: Text('Search Profile'),
                              border: OutlineInputBorder()),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.034,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return constraintsProvider.profileConstraints[index];
                        },
                        itemCount:
                            constraintsProvider.profileConstraints.length,
                      ),
                    ),
                    SizedBox(
                      height: height * 0.6,
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return profiles[index];
                        },
                        itemCount: profiles.length,
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ));
  }
}
