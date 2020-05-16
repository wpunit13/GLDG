import 'package:GLDG/data/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/flutter_multiselect.dart';
import '../data/constants.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class MultipleSelect extends StatelessWidget {
  final String title;
  final List inputList;

  MultipleSelect({this.title, this.inputList});

  List<String> returnList;
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  void _onFormSaved() {
    final FormState form = _formKey.currentState;
    form.save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        title,
      )),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 9,
              child: Form(
                  key: _formKey,
                  child: MultiSelect(
                    autovalidate: false,
                    backFillColor: kInactiveCardColour,
                    //titleText: title,
                    validator: (value) {
                      if (value == null) {
                        return 'Please select one or more option(s)';
                      } else
                        return '';
                    },
                    errorText: 'Please select one or more option(s)',
                    dataSource: inputList,
                    textField: 'display',
                    valueField: 'display',
                    filterable: true,
                    required: true,
                    onSaved: (value) {
                      returnList = List<String>.from(value);
                    },
                    value: null,
                  )),
            ),
            Expanded(
              flex: 1,
              child: ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    ButtonTheme(
                      height: 50.0,
                      child: RaisedButton.icon(
                        label: Text('Save'),
                        icon: Icon(
                          FontAwesomeIcons.save,
                          size: 20.0,
                        ),
                        color: kBottomContainerColor,
                        textColor: Colors.white,
                        onPressed: () {
                          _onFormSaved();
                          Navigator.pop(context, returnList);
                        },
                      ),
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
