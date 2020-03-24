import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trace_19_covid/models/survey_form.dart';
import 'package:trace_19_covid/survey/survey_bloc.dart';
import 'package:trace_19_covid/survey/survey_state.dart';
import 'package:trace_19_covid/utils/multi_chips.dart';
import 'package:trace_19_covid/utils/utils.dart';

class SurveyPage2 extends StatefulWidget {
  SurveyPage2({Key key}) : super(key: key);

  @override
  _SurveyPage2State createState() => new _SurveyPage2State();
}

class _SurveyPage2State extends State<SurveyPage2> {
  Temperature temperature;

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
                            Text("What is your current body temperature?"),
                            Spacer(),
                            _temperatureDropDown()
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
                        padding: EdgeInsets.all(16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Select any of the below symptoms:"),
                            MultiSelectChip(SurveyForm.symptomsList),
                            Text("Select any of the additional symptoms:"),
                            MultiSelectChip(SurveyForm.addSymptomsList)
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

  DropdownButton _temperatureDropDown() => DropdownButton<Temperature>(
        items: [
          DropdownMenuItem<Temperature>(
            value: Temperature.NO_FEVER,
            child: Text(
              SurveyForm.getTemperature(Temperature.NO_FEVER),
            ),
          ),
          DropdownMenuItem<Temperature>(
            value: Temperature.MILD_FEVER,
            child: Text(
              SurveyForm.getTemperature(Temperature.MILD_FEVER),
            ),
          ),
          DropdownMenuItem<Temperature>(
            value: Temperature.HIGH_FEVER,
            child: Text(
              SurveyForm.getTemperature(Temperature.HIGH_FEVER),
            ),
          ),
        ],
        onChanged: (value) {
          setState(() {
            temperature = value;
          });
        },
        hint: Text(
          "Please select temperature range",
          style: TextStyle(fontSize: 14),
        ),
        value: temperature,
        elevation: 2,
        style: TextStyle(color: Colors.green, fontSize: 20),
        isDense: true,
        iconSize: 40.0,
      );
}
