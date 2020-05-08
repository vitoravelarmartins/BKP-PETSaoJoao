import 'package:flutter/material.dart';
import 'package:petsaojoao/components/foundation_form/appbar_foundation.dart';
import 'package:petsaojoao/components/foundation_form/body_foundation.dart';
import 'package:petsaojoao/components/register_tutor/data_security_info.dart';

class ContactInfo extends StatefulWidget {
  @override
  _ContactInfoState createState() => _ContactInfoState();
}

class _ContactInfoState extends State<ContactInfo> {
  String steps = "3 de 3";
  String questionTittle = "Como te contactamos?";
  var arrowBackIcon = Icons.arrow_back;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            child: AppBarFoundation(arrowBackIcon),
            preferredSize: Size.fromHeight(50.0)),
        body: ListView(children: <Widget>[
          BodyFoundation(steps, questionTittle),
          SizedBox(height: 10.0),
          DataSecurityInfo(),
          SizedBox(height: 10.0),
          Container(
            padding: EdgeInsets.only(
              left: 15,
              right: 15,
            ),
            child: FormContact(),
          ),
        ]));
  }
}

class FormContact extends StatefulWidget {
  @override
  _FormContactState createState() => _FormContactState();
}

class _FormContactState extends State<FormContact> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
