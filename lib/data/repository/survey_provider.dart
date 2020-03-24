import 'package:trace_19_covid/data/dao/survey_dao.dart';
import 'package:trace_19_covid/models/survey.dart';

class SurveyProvider {
  final surveyDao = SurveyDao();

  Future getSurvey({String query}) => surveyDao.getSurvey();

  Future insertSurvey(Survey survey) => surveyDao.createSurvey(survey);

  Future updateSurvey(Survey survey) => surveyDao.updateSurvey(survey);
}
