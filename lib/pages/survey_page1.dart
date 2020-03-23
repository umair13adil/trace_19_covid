import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trace_19_covid/survey/survey_bloc.dart';
import 'package:trace_19_covid/survey/survey_state.dart';
import 'package:trace_19_covid/utils/utils.dart';

class SurveyPage1 extends StatefulWidget {
  SurveyPage1({Key key}) : super(key: key);

  @override
  _SurveyPage1State createState() => new _SurveyPage1State();
}

class _SurveyPage1State extends State<SurveyPage1> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SurveyBloc, SurveyState>(builder: (context, state) {
      return Container(
        decoration: BoxDecoration(
          gradient: Utils.gradients[0],
        ),
        child: Center(
          child: Text(
            "Page 1",
            style: TextStyle(color: Colors.white, fontSize: 22.0),
          ),
        ),
      );
    });
  }
}
