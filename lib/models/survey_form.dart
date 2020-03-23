enum Gender { MALE, FEMALE }
enum Temperature { NO_FEVER, MILD_FEVER, HIGH_FEVER }
enum TravelHistory {
  TRAVELED,
  NOT_TRAVELED,
  FAMILY_TRAVELED,
  NO_TRAVEL_HISTORY
}
enum Exposure { MET_SOMEONE, DID_NOT_MET_ANYONE, HAD_CLOSE_CONTACT }
enum Condition { IMPROVED, NO_CHANGE, WORSENED }

List<String> symptomsList = [
  'Dry Cough',
  'Sneezing',
  'Sore Throat',
  'Weakness',
  'Flu',
  'None of these'
];

List<String> addSymptomsList = [
  'Moderate to Severe Cough',
  'Feeling Breathless',
  'Difficulty in Breathing',
  'Drowsiness',
  'Persistent pain in chest',
  'Severe Weakness',
  'None of these'
];

List<String> medicalHistoryList = [
  'Diabetes',
  'High Blood Pressure',
  'Heart Disease',
  'Lung Disease',
  'None of these'
];

class Survey {
  int age;
  Gender gender;
  List<String> symptoms;
  List<String> additionalSymptoms;
  Temperature temperature;
  TravelHistory travelHistory;
  Exposure exposure;
  List<String> medicalHistory;
  Condition condition;

  String getTemperature(Temperature t) {
    switch (t) {
      case Temperature.NO_FEVER:
        return 'No Fever';
      case Temperature.MILD_FEVER:
        return 'Mild Fever';
      case Temperature.HIGH_FEVER:
        return 'High Fever';
      default:
        return null;
    }
  }

  String getTravelHistory(TravelHistory t) {
    switch (t) {
      case TravelHistory.TRAVELED:
        return 'Traveled in last 14 days';
      case TravelHistory.NOT_TRAVELED:
        return 'Did not Travel in last 14 days';
      case TravelHistory.FAMILY_TRAVELED:
        return 'Immediate Family Member Travelled in last 14 days';
      case TravelHistory.NO_TRAVEL_HISTORY:
        return 'No Travel History';
      default:
        return null;
    }
  }

  String getExposure(Exposure t) {
    switch (t) {
      case Exposure.MET_SOMEONE:
        return 'Met someone with similar symptoms';
      case Exposure.DID_NOT_MET_ANYONE:
        return 'Did not meet anyone with similar symptoms';
      case Exposure.DID_NOT_MET_ANYONE:
        return 'Close contact with someone with COVID-19 in last 14 days';
      default:
        return null;
    }
  }

  String getCondition(Condition t) {
    switch (t) {
      case Condition.IMPROVED:
        return 'Improved';
      case Condition.NO_CHANGE:
        return 'No Change';
      case Condition.WORSENED:
        return 'Worsened';
      default:
        return null;
    }
  }
}
