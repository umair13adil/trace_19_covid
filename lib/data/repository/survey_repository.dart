import 'dart:convert';

import 'package:trace_19_covid/data/repository/survey_provider.dart';
import 'package:trace_19_covid/models/survey_form.dart';

class SurveyRepository {
  SurveyProvider _provider = SurveyProvider();

  Future<Survey> loadSurvey() async {
    return _provider.getSurveyData();
  }
}
