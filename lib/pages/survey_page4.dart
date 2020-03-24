import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trace_19_covid/models/survey_form.dart';
import 'package:trace_19_covid/survey/survey_bloc.dart';
import 'package:trace_19_covid/survey/survey_state.dart';
import 'package:trace_19_covid/utils/utils.dart';

class SurveyPage4 extends StatefulWidget {
  SurveyPage4({Key key}) : super(key: key);

  @override
  _SurveyPage4State createState() => new _SurveyPage4State();
}

class _SurveyPage4State extends State<SurveyPage4> {
  Condition condition;

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
                            Text("Has your condition improved?"),
                            Spacer(),
                            _conditionDropDown()
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

  DropdownButton _conditionDropDown() => DropdownButton<Condition>(
        items: [
          DropdownMenuItem<Condition>(
            value: Condition.IMPROVED,
            child: Text(
              SurveyForm.getCondition(Condition.IMPROVED),
            ),
          ),
          DropdownMenuItem<Condition>(
            value: Condition.NO_CHANGE,
            child: Text(
              SurveyForm.getCondition(Condition.NO_CHANGE),
            ),
          ),
          DropdownMenuItem<Condition>(
            value: Condition.WORSENED,
            child: Text(
              SurveyForm.getCondition(Condition.WORSENED),
            ),
          ),
        ],
        onChanged: (value) {
          setState(() {
            condition = value;
          });
        },
        hint: Text(
          "Please select your condition. (If Exposed)",
          style: TextStyle(fontSize: 12),
        ),
        value: condition,
        elevation: 2,
        style: TextStyle(color: Colors.green, fontSize: 16),
        isDense: true,
        iconSize: 40.0,
      );
}
