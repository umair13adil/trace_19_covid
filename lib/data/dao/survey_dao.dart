import 'dart:async';
import 'package:trace_19_covid/data/database/database.dart';
import 'package:trace_19_covid/models/survey.dart';

class SurveyDao {
  final dbProvider = DatabaseProvider.dbProvider;

  Future<int> createSurvey(Survey survey) async {
    final db = await dbProvider.database;
    var result = db.insert(surveyTable, survey.toDatabaseJson());
    return result;
  }

  Future<Survey> getSurvey() async {
    final db = await dbProvider.database;

    List<Map> result = await db.query(surveyTable);

    if (result.isNotEmpty) {
      result.forEach((row) => print(row));

      return Survey.fromDatabaseJson(result.first);
    } else {
      return Survey.name(1);
    }
  }

  Future<int> updateSurvey(Survey survey) async {
    final db = await dbProvider.database;

    var result = await db.update(surveyTable, survey.toDatabaseJson(),
        where: "id = ?", whereArgs: [survey.id]);

    return result;
  }
}
