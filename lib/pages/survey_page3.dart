import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trace_19_covid/survey/survey_bloc.dart';
import 'package:trace_19_covid/survey/survey_state.dart';
import 'package:trace_19_covid/utils/utils.dart';

class SurveyPage3 extends StatefulWidget {
  SurveyPage3({Key key}) : super(key: key);

  @override
  _SurveyPage3State createState() => new _SurveyPage3State();
}

class _SurveyPage3State extends State<SurveyPage3> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SurveyBloc, SurveyState>(builder: (context, state) {
      return Container(
        decoration: BoxDecoration(
          gradient: Utils.gradients[2],
        ),
        child: Center(
          child: Text(
            "Page 3",
            style: TextStyle(color: Colors.white, fontSize: 22.0),
          ),
        ),
      );
    });
  }
}
