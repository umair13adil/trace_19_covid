class Survey {
  int id;
  int age;
  String gender;
  String symptoms;
  String additionalSymptoms;
  String temperature;
  String travelHistory;
  String exposure;
  String medicalHistory;
  String condition;


  Survey.name(this.id);

  Survey(
      this.id,
      this.age,
      this.gender,
      this.symptoms,
      this.additionalSymptoms,
      this.temperature,
      this.travelHistory,
      this.exposure,
      this.medicalHistory,
      this.condition);

  factory Survey.fromDatabaseJson(Map<String, dynamic> data) => Survey(
      data['id'],
      data['age'],
      data['gender'],
      data['symptoms'],
      data['additionalSymptoms'],
      data['temperature'],
      data['travelHistory'],
      data['exposure'],
      data['medicalHistory'],
      data['condition']);

  Map<String, dynamic> toDatabaseJson() => {
        "id": this.id,
        "age": this.age,
        "gender": this.gender,
        "symptoms": this.symptoms,
        "additionalSymptoms": this.additionalSymptoms,
        "temperature": this.temperature,
        "travelHistory": this.travelHistory,
        "exposure": this.exposure,
        "medicalHistory": this.medicalHistory,
        "condition": this.condition,
      };
}
