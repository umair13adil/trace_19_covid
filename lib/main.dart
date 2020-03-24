import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trace_19_covid/survey/survey_bloc.dart';
import 'package:trace_19_covid/survey/survey_screen.dart';

import 'data/bloc/bloc_delegate.dart';
import 'data/repository/survey_repository.dart';

void main() async {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Covid-19 Survey App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => SurveyBloc(surveyRepository: SurveyRepository()),
        child: SurveyScreen(),
      ),
    );
  }
}
