import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trace_19_covid/models/survey_form.dart';
import 'package:trace_19_covid/survey/survey_bloc.dart';
import 'package:trace_19_covid/survey/survey_state.dart';
import 'package:trace_19_covid/utils/utils.dart';

class SurveyPage1 extends StatefulWidget {
  SurveyPage1({Key key}) : super(key: key);

  @override
  _SurveyPage1State createState() => new _SurveyPage1State();
}

class _SurveyPage1State extends State<SurveyPage1> {
  Gender gender = Gender.MALE;
  double cSize = 100.0;
  double size = 56.0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SurveyBloc, SurveyState>(builder: (context, state) {
      return Container(
        padding: EdgeInsets.only(top: 100.0),
        decoration: BoxDecoration(
          gradient: Utils.gradients[0],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            child: Center(
              child: Form(
                key: Utils.formKey,
                child: ListView(
                  physics: ClampingScrollPhysics(),
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Container(
                        color: Colors.white,
                        height: 120.0,
                        padding: EdgeInsets.all(16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("What is your age?"),
                            Spacer(),
                            TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Enter Age Here',
                                hintText: 'Enter Age Here',
                              ),
                              autofocus: false,
                              inputFormatters: [
                                WhitelistingTextInputFormatter.digitsOnly
                              ],
                              textInputAction: TextInputAction.done,
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                      signed: false, decimal: false),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Container(
                        color: Colors.white,
                        height: 200.0,
                        padding: EdgeInsets.all(16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("What is your gender?"),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Row(
                                children: <Widget>[
                                  GestureDetector(
                                    onTap: () =>
                                        setState(() => gender = Gender.MALE),
                                    child: Container(
                                      height: cSize,
                                      width: cSize,
                                      decoration: gender == Gender.MALE
                                          ? Utils.boxDecoration()
                                          : BoxDecoration(),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          FaIcon(FontAwesomeIcons.male,
                                              size: size,
                                              color: gender == Gender.MALE
                                                  ? Colors.green
                                                  : Colors.grey),
                                          Text(
                                            "Male",
                                            style: TextStyle(
                                              color: gender == Gender.MALE
                                                  ? Colors.green
                                                  : Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 4),
                                  GestureDetector(
                                    onTap: () =>
                                        setState(() => gender = Gender.FEMALE),
                                    child: Container(
                                      height: cSize,
                                      width: cSize,
                                      padding: EdgeInsets.all(8.0),
                                      decoration: gender == Gender.FEMALE
                                          ? Utils.boxDecoration()
                                          : BoxDecoration(),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          FaIcon(
                                            FontAwesomeIcons.female,
                                            size: size,
                                            color: gender == Gender.FEMALE
                                                ? Colors.green
                                                : Colors.grey,
                                          ),
                                          Text(
                                            "Female",
                                            style: TextStyle(
                                              color: gender == Gender.FEMALE
                                                  ? Colors.green
                                                  : Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
