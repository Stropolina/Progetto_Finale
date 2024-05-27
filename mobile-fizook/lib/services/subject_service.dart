import 'package:fizook/helpers/rest_client.dart';
import 'package:fizook/model/subject.dart';

import '../model/response.dart';
import 'common.dart';

class SubjectService {
  RestClient client = RestClient(baseUrl);

  getSubjects () async {
    Response<List<Subject>> response = await client.get<Response<List<Subject>>>("/subjects", (json) => Response.fromJson(json, (json) => (json as List<dynamic>).map<Subject>((item) => Subject.fromJson(item as Map<String, dynamic>)).toList()));

    return response;
  }
}