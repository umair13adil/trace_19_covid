import 'package:trace_19_covid/data/repository/survey_provider.dart';
import 'package:trace_19_covid/models/survey.dart';

class SurveyRepository {
  SurveyProvider _provider = SurveyProvider();

  Future<int> insertSurvey(Survey survey) async {
    return _provider.insertSurvey(survey);
  }

  Future<int> updateSurvey(Survey survey) async {
    return _provider.updateSurvey(survey);
  }

  Future<Survey> loadSurvey() async {
    return _provider.getSurvey();
  }
}
