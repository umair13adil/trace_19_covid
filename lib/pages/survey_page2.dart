import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trace_19_covid/survey/survey_bloc.dart';
import 'package:trace_19_covid/survey/survey_state.dart';
import 'package:trace_19_covid/utils/utils.dart';

class SurveyPage2 extends StatefulWidget {
  SurveyPage2({Key key}) : super(key: key);

  @override
  _SurveyPage2State createState() => new _SurveyPage2State();
}

class _SurveyPage2State extends State<SurveyPage2> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SurveyBloc, SurveyState>(builder: (context, state) {
      return Container(
        decoration: BoxDecoration(
          gradient: Utils.gradients[1],
        ),
        child: Center(
          child: Text(
            "Page 2",
            style: TextStyle(color: Colors.white, fontSize: 22.0),
          ),
        ),
      );
    });
  }
}
