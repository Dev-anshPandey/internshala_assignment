import 'package:flutter/material.dart';
import 'package:internshala/provider/contraints.dart';
import 'package:provider/provider.dart';

String? dropdownvalue;

// List of items in our dropdown menu
var items = ['1', '2', '3', '4', '6', '12', '24', '36', 'none'];

class Filter extends StatefulWidget {
  const Filter({super.key});

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Consumer<ConstraintsProvider>(
      builder: (context, value, child) {
        final constraintsProvider =
            Provider.of<ConstraintsProvider>(context, listen: false);
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.only(top: height * 0.06, left: width * 0.04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    InkWell(
                        onTap: () => Navigator.pop(context),
                        child: Icon(Icons.arrow_back)),
                    Padding(
                      padding: EdgeInsets.only(left: width * 0.02),
                      child: Text(
                        'Filters',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: height * 0.024),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: height * 0.04, left: width * 0.02),
                  child: Text(
                    'PROFILE',
                    style:
                        TextStyle(color: Colors.grey, fontSize: height * 0.018),
                  ),
                ),
                constraintsProvider.profileConstraints.length > 0
                    ? SizedBox(
                        height: height * 0.034,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount:
                              constraintsProvider.profileConstraints.length,
                          itemBuilder: (context, index) {
                            return constraintsProvider
                                .profileConstraints[index];
                          },
                        ),
                      )
                    : SizedBox(),
                Padding(
                  padding:
                      EdgeInsets.only(top: height * 0.012, left: width * 0.02),
                  child: InkWell(
                    onTap: () => Navigator.pushNamed(context, '/profile'),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: height * 0.003,
                              left: width * 0.02,
                              right: width * 0.04),
                          child: Icon(
                            Icons.add,
                            color: Colors.blue,
                            size: height * 0.02,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: height * 0.00, left: width * 0.02),
                          child: Text(
                            'Add profile',
                            style: TextStyle(
                                color: Colors.blue, fontSize: height * 0.018),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: height * 0.04, left: width * 0.02),
                  child: Text(
                    'CITY',
                    style:
                        TextStyle(color: Colors.grey, fontSize: height * 0.018),
                  ),
                ),
                constraintsProvider.cityConstraints.length > 0
                    ? SizedBox(
                        height: height * 0.034,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: constraintsProvider.cityConstraints.length,
                          itemBuilder: (context, index) {
                            return constraintsProvider.cityConstraints[index];
                          },
                        ),
                      )
                    : SizedBox(),
                Padding(
                  padding:
                      EdgeInsets.only(top: height * 0.012, left: width * 0.02),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/city');
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: height * 0.003,
                              left: width * 0.02,
                              right: width * 0.04),
                          child: Icon(
                            Icons.add,
                            color: Colors.blue,
                            size: height * 0.02,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: height * 0.00, left: width * 0.02),
                          child: Text(
                            'Add city',
                            style: TextStyle(
                                color: Colors.blue, fontSize: height * 0.018),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: height * 0.04,
                      left: width * 0.02,
                      bottom: height * 0.02),
                  child: Text(
                    'MAXIMUM DURATION (IN MONTHS)',
                    style:
                        TextStyle(color: Colors.grey, fontSize: height * 0.018),
                  ),
                ),
                Container(
                  width: width * 0.9,
                  child: FormField(
                    builder: (field) {
                      return InputDecorator(
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(12, 4, 20, 4),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0))),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            // Initial Value
                            value: constraintsProvider.duration,
                            hint: Text('Choose Duration'),
                            disabledHint: Text('Choose Duration'),

                            // Down Arrow Icon
                            icon: const Icon(Icons.arrow_drop_down_sharp),
                            style: TextStyle(
                                color: Colors.black, fontSize: height * 0.018),
                            // Array list of items
                            items: items.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                            // After selecting the desired option,it will
                            // change button value to selected value
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownvalue = newValue!;
                                constraintsProvider.setDuration(newValue);
                              });
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Expanded(child: SizedBox()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        constraintsProvider.clearAllCity();
                        constraintsProvider.clearAllProfile();
                        constraintsProvider.setDuration('none');
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.blue,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: height * 0.01,
                              bottom: height * 0.01,
                              left: width * 0.13,
                              right: width * 0.13),
                          child: Text('Clear All',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: height * 0.018)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: height * 0.01,
                          bottom: height * 0.01,
                          left: width * 0.026,
                          right: width * 0.076),
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
                                top: height * 0.012,
                                bottom: height * 0.012,
                                left: width * 0.15,
                                right: width * 0.15),
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
              ],
            ),
          ),
        );
      },
    );
  }
}
