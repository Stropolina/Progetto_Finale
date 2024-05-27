import 'package:fizook/helpers/rest_client.dart';
import 'package:fizook/model/room.dart';

import '../model/response.dart';
import 'common.dart';

class RoomService {
  RestClient client = RestClient(baseUrl);

  getRooms () async {
    Response<List<Room>> response = await client.get<Response<List<Room>>>("/rooms", (json) => Response.fromJson(json, (json) => (json as List<dynamic>).map<Room>((item) => Room.fromJson(item as Map<String, dynamic>)).toList()));

    return response;
  }
}