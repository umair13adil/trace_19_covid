import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class SurveyEvent extends Equatable {
  const SurveyEvent();
}

class StartSurveyStep1 extends SurveyEvent {

  const StartSurveyStep1();

  @override
  List<Object> get props => [];
}

class StartSurveyStep2 extends SurveyEvent {

  const StartSurveyStep2();

  @override
  List<Object> get props => [];
}

class StartSurveyStep3 extends SurveyEvent {

  const StartSurveyStep3();

  @override
  List<Object> get props => [];
}