import 'package:flutter/material.dart';
import 'package:internshala/provider/contraints.dart';
import 'package:internshala/widgets/choose_city.dart';
import 'package:internshala/widgets/selected_city_constraints.dart';
import 'package:provider/provider.dart';

List<ConstrainContainerCity> profiles = [];

class City extends StatefulWidget {
  const City({super.key});

  @override
  State<City> createState() => CityState();
}

class CityState extends State<City> {
  @override
  void initState() {
   if(profiles.length==0){
     profiles.clear();
    profiles.addAll([
      ConstrainContainerCity(
          id: DateTime.now().millisecondsSinceEpoch * 1, name: "Munnar"),
      ConstrainContainerCity(
          id: DateTime.now().millisecondsSinceEpoch * 2, name: "Tarn Taran"),
      ConstrainContainerCity(
          id: DateTime.now().millisecondsSinceEpoch * 3,
          name: "Banga (Philippines)"),
      ConstrainContainerCity(
          id: DateTime.now().millisecondsSinceEpoch * 4, name: "Delhi"),
      ConstrainContainerCity(
          id: DateTime.now().millisecondsSinceEpoch * 5, name: "Gurgaon"),
      // ChoseProfile(
      //     id: DateTime.now().millisecondsSinceEpoch * 6,
      //     name: "Product Management"),
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
                              constraintsProvider.clearAllCity();
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
                          return constraintsProvider.cityConstraints[index];
                        },
                        itemCount: constraintsProvider.cityConstraints.length,
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
