import 'package:flutter/material.dart';
import 'package:internshala/provider/contraints.dart';
import 'package:provider/provider.dart';

class SelectedContraints extends StatelessWidget {
  String name;
  int id;
  SelectedContraints({required this.id, required this.name});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Consumer<ConstraintsProvider>(
      builder: (context, value, child) {
        final constraintsProvider =
            Provider.of<ConstraintsProvider>(context, listen: false);
        return Padding(
          padding: EdgeInsets.only(left: width * 0.02, right: width * 0.01),
          child: InkWell(
            onTap: () {
              constraintsProvider.removeProfile(id);
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      name,
                      style: TextStyle(
                          color: Colors.white, fontSize: height * 0.016),
                    ),
                  ),
                  Icon(
                    Icons.cancel,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}