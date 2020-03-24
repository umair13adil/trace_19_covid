import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trace_19_covid/models/survey_form.dart';
import 'package:trace_19_covid/survey/survey_bloc.dart';
import 'package:trace_19_covid/survey/survey_state.dart';
import 'package:trace_19_covid/utils/multi_chips.dart';
import 'package:trace_19_covid/utils/utils.dart';

class SurveyPage3 extends StatefulWidget {
  SurveyPage3({Key key}) : super(key: key);

  @override
  _SurveyPage3State createState() => new _SurveyPage3State();
}

class _SurveyPage3State extends State<SurveyPage3> {

  TravelHistory travelHistory;
  Exposure exposure;

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
                            Text("Have you or your family member traveled recently?"),
                            Spacer(),
                            _travelHistoryDropDown()
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
                        padding: EdgeInsets.only(top: 16, bottom: 16, left: 16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Did you have an exposure of any kind?"),
                           _exposureDropDown()
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
                            Text("Tell us about your medical history."),
                            MultiSelectChip(SurveyForm.medicalHistoryList)
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

  DropdownButton _travelHistoryDropDown() => DropdownButton<TravelHistory>(
    items: [
      DropdownMenuItem<TravelHistory>(
        value: TravelHistory.TRAVELED,
        child: Text(
          SurveyForm.getTravelHistory(TravelHistory.TRAVELED),
        ),
      ),
      DropdownMenuItem<TravelHistory>(
        value: TravelHistory.NOT_TRAVELED,
        child: Text(
          SurveyForm.getTravelHistory(TravelHistory.NOT_TRAVELED),
        ),
      ),
      DropdownMenuItem<TravelHistory>(
        value: TravelHistory.FAMILY_TRAVELED,
        child: Text(
          SurveyForm.getTravelHistory(TravelHistory.FAMILY_TRAVELED),
        ),
      ),
    ],
    onChanged: (value) {
      setState(() {
        travelHistory = value;
      });
    },
    hint: Text(
      SurveyForm.getTravelHistory(TravelHistory.NO_TRAVEL_HISTORY),
      style: TextStyle(fontSize: 12),
    ),
    value: travelHistory,
    elevation: 2,
    style: TextStyle(color: Colors.green, fontSize: 11),
    isDense: true,
    iconSize: 40.0,
  );

  DropdownButton _exposureDropDown() => DropdownButton<Exposure>(
    items: [
      DropdownMenuItem<Exposure>(
        value: Exposure.MET_SOMEONE,
        child: Text(
          SurveyForm.getExposure(Exposure.MET_SOMEONE),
        ),
      ),
      DropdownMenuItem<Exposure>(
        value: Exposure.DID_NOT_MET_ANYONE,
        child: Text(
          SurveyForm.getExposure(Exposure.DID_NOT_MET_ANYONE),
        ),
      ),
      DropdownMenuItem<Exposure>(
        value: Exposure.HAD_CLOSE_CONTACT,
        child: Text(
          SurveyForm.getExposure(Exposure.HAD_CLOSE_CONTACT),
        ),
      ),
    ],
    onChanged: (value) {
      setState(() {
        exposure = value;
      });
    },
    hint: Text(
      "Please select your exposure status.",
      style: TextStyle(fontSize: 12),
    ),
    value: exposure,
    elevation: 2,
    style: TextStyle(color: Colors.green, fontSize: 10),
    isDense: true,
    iconSize: 40.0,
  );
}
