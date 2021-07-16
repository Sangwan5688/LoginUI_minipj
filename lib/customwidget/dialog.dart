import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:miniproject/customwidget/gradient_container.dart';

class CustomDialogBox extends StatefulWidget {
  final String? title, description;

  const CustomDialogBox({Key? key, this.title, this.description})
      : super(key: key);

  @override
  _CustomDialogBoxState createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      clipBehavior: Clip.antiAlias,
      elevation: 5,
      backgroundColor: Colors.transparent,
      child: GradientContainer(
        child: dialogBox(context),
      ),
    );
  }

  dialogBox(context) {
    return Container(
      padding: EdgeInsets.only(top: 15.0, bottom: 10.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            widget.title!,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            widget.description!,
            style: TextStyle(fontSize: 14),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 15.0, bottom: 10.0),
              child: TextButton(
                  style: TextButton.styleFrom(
                    primary: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.grey[700]!,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "Close",
                    style: TextStyle(fontSize: 18),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
