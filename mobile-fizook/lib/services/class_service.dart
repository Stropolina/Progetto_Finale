import 'package:fizook/helpers/rest_client.dart';
import 'package:fizook/model/class.dart';

import '../model/response.dart';
import 'common.dart';

class ClassService {
  RestClient client = RestClient(baseUrl);

  getClasses () async {
    Response<List<Class>> response = await client.get<Response<List<Class>>>("/classes", (json) => Response.fromJson(json, (json) => (json as List<dynamic>).map<Class>((item) => Class.fromJson(item as Map<String, dynamic>)).toList()));

    return response;
  }
}