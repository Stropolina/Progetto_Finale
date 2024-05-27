import 'package:fizook/helpers/rest_client.dart';
import 'package:fizook/model/activity.dart';

import '../model/response.dart';
import 'common.dart';

class ActivityService {
  RestClient client = RestClient(baseUrl);

  getActivities () async {
    Response<List<Activity>> response = await client.get<Response<List<Activity>>>("/activities", (json) => Response.fromJson(json, (json) => (json as List<dynamic>).map<Activity>((item) => Activity.fromJson(item as Map<String, dynamic>)).toList()));

    return response;
  }
}