import 'package:bloc/bloc.dart';
import 'package:trace_19_covid/data/repository/survey_repository.dart';
import 'package:meta/meta.dart';
import 'package:trace_19_covid/models/survey.dart';
import 'survey_event.dart';
import 'survey_state.dart';

class SurveyBloc extends Bloc<SurveyEvent, SurveyState> {
  final SurveyRepository surveyRepository;

  SurveyBloc({@required this.surveyRepository})
      : assert(SurveyRepository != null);

  @override
  SurveyState get initialState => SurveyStep1();

  @override
  Stream<SurveyState> mapEventToState(SurveyEvent event) async* {
    if (event is StartSurveyStep1) {
      try {
        final Survey survey = await surveyRepository.loadSurvey();
        yield SurveyStep1(survey: survey);
      } catch (e) {
        print(e);
        yield SurveyError();
      }
    }else if (event is StartSurveyStep2) {
      try {
        final Survey survey = await surveyRepository.loadSurvey();
        yield SurveyStep2(survey: survey);
      } catch (e) {
        print(e);
        yield SurveyError();
      }
    }else if (event is StartSurveyStep3) {
      try {
        final Survey survey = await surveyRepository.loadSurvey();
        yield SurveyStep3(survey: survey);
      } catch (e) {
        print(e);
        yield SurveyError();
      }
    }else if (event is StartSurveyStep4) {
      try {
        final Survey survey = await surveyRepository.loadSurvey();
        yield SurveyStep4(survey: survey);
      } catch (e) {
        print(e);
        yield SurveyError();
      }
    }
  }
}
