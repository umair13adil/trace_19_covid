import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trace_19_covid/pages/survey_page1.dart';
import 'package:trace_19_covid/pages/survey_page2.dart';
import 'package:trace_19_covid/pages/survey_page3.dart';
import 'package:trace_19_covid/survey/survey_event.dart';
import 'package:trace_19_covid/utils/step_progress_view.dart';

import 'survey_bloc.dart';
import 'survey_state.dart';

class SurveyScreen extends StatefulWidget {
  SurveyScreen({Key key}) : super(key: key);

  @override
  _SurveysScreenState createState() => new _SurveysScreenState();
}

class _SurveysScreenState extends State<SurveyScreen> {
  final tag = "SurveysScreen";
  int currentPageValue = 0;

  Size _safeAreaSize;
  PageController controller = PageController();
  SurveyBloc bloc;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
    var mediaQD = MediaQuery.of(context);
    _safeAreaSize = mediaQD.size;
    bloc = BlocProvider.of<SurveyBloc>(context);

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('Flutter Survey'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.info_outline),
            onPressed: () async {},
          )
        ],
      ),
      body: BlocBuilder<SurveyBloc, SurveyState>(
        builder: (context, state) {
          print("State: $state");
          if (state is SurveyStep1) {
            final surveys = state.survey;
            return _buildPagerView(controller, 1, SurveyPage1());
          } else if (state is SurveyStep2) {
            final surveys = state.survey;
            return _buildPagerView(controller, 2, SurveyPage2());
          } else if (state is SurveyStep3) {
            final surveys = state.survey;
            return _buildPagerView(controller, 3, SurveyPage3());
          } else if (state is SurveyError) {
            return Text(
              'Something went wrong!',
              style: TextStyle(color: Colors.red),
            );
          } else {
            return Text(
              'No View',
              style: TextStyle(color: Colors.red),
            );
          }
        },
      ),
    );
  }

  Widget _buildPagerView(PageController controller, int page, Widget screen) {
    return Stack(
      children: <Widget>[
        BlocProvider(
          create: (context) => bloc,
          child: screen,
        ),
        Positioned(
            top: 0.0,
            child: Container(height: 100.0, child: setProgressView(page))),
        Positioned(
          bottom: 0,
          right: 0,
          child: RaisedButton(
            color: Colors.white,
            onPressed: () {
              if (currentPageValue <= 2) {
                currentPageValue = currentPageValue + 1;
                print('_buildPagerView: $currentPageValue');

                switch (currentPageValue) {
                  case 0:
                    bloc.add(StartSurveyStep1());
                    break;
                  case 1:
                    bloc.add(StartSurveyStep2());
                    break;
                  case 2:
                    bloc.add(StartSurveyStep3());
                    break;
                }
              }
            },
            child: Text('Next'),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          child: RaisedButton(
            color: Colors.white,
            onPressed: () {
              if (currentPageValue >= 0) {
                currentPageValue = currentPageValue - 1;
                print('_buildPagerView: $currentPageValue');

                switch (currentPageValue) {
                  case 0:
                    bloc.add(StartSurveyStep1());
                    break;
                  case 1:
                    bloc.add(StartSurveyStep2());
                    break;
                  case 2:
                    bloc.add(StartSurveyStep3());
                    break;
                }
              }
            },
            child: Text('Previous'),
          ),
        ),
      ],
    );
  }

  StepProgressView setProgressView(int currentStep) {
    return StepProgressView(
      ["About you", "Some more..", "Your credit card details"],
      currentStep,
      120.0,
      _safeAreaSize.width,
      10.0,
      Colors.green,
      Colors.grey,
      TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
      TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
      decoration: BoxDecoration(color: Colors.white),
      padding: EdgeInsets.only(
        top: 10.0,
        left: 24.0,
        right: 24.0,
      ),
    );
  }
}
