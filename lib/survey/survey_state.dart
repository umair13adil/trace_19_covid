import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:trace_19_covid/models/survey.dart';

abstract class SurveyState extends Equatable {
  const SurveyState();

  @override
  List<Object> get props => [];
}

class SurveyStep1 extends SurveyState {
  final Survey survey;

  const SurveyStep1({@required this.survey}) : assert(Survey != null);

  @override
  List<Object> get props => [survey];
}

class SurveyStep2 extends SurveyState {
  final Survey survey;

  const SurveyStep2({@required this.survey}) : assert(Survey != null);

  @override
  List<Object> get props => [survey];
}

class SurveyStep3 extends SurveyState {
  final Survey survey;

  const SurveyStep3({@required this.survey}) : assert(Survey != null);

  @override
  List<Object> get props => [survey];
}

class SurveyStep4 extends SurveyState {
  final Survey survey;

  const SurveyStep4({@required this.survey}) : assert(Survey != null);

  @override
  List<Object> get props => [survey];
}

class SurveyError extends SurveyState {}
