
import 'package:flutter/material.dart';
import 'package:internshala/provider/contraints.dart';
import 'package:internshala/widgets/selected_constraints.dart';
import 'package:provider/provider.dart';

class ConstraintContainerProfile extends StatefulWidget {
  String name;
  int id;
  ConstraintContainerProfile({required this.id, required this.name});

  @override
  State<ConstraintContainerProfile> createState() => _ConstraintContainerProfileState();
}

class _ConstraintContainerProfileState extends State<ConstraintContainerProfile> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Consumer<ConstraintsProvider>(
      builder: (context, value, child) {
        final constraintsProvider =
            Provider.of<ConstraintsProvider>(context, listen: false);

        return Container(
          child: InkWell(
            onTap: () {
              setState(() {
                if (constraintsProvider.profileConstraints
                        .indexWhere((element) => element.id == widget.id) >=
                    0) {
                  constraintsProvider.removeProfile(widget.id);
                  // checked = false;
                } else {
                  constraintsProvider.addProfile(
                      SelectedContraints(id: widget.id, name: widget.name));
                  // checked = true;
                }

                print(widget.id);
                print(constraintsProvider.profileConstraints.length);
              });
            },
            child: Row(
              children: [
                Checkbox(
                  value: constraintsProvider.profileConstraints
                          .indexWhere((element) => element.id == widget.id) >=
                      0,
                  onChanged: (value) {
                    setState(() {
                      if (constraintsProvider.profileConstraints.indexWhere(
                              (element) => element.id == widget.id) >=
                          0) {
                        constraintsProvider.removeProfile(widget.id);
                        // checked = false;
                      } else {
                        constraintsProvider.addProfile(SelectedContraints(
                            id: widget.id, name: widget.name));
                        // checked = true;
                      }
                    });
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(left: width * 0.01),
                  child: Text(
                    widget.name,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: height * 0.018),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
