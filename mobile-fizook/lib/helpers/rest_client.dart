import 'package:http/http.dart' as http;
import 'dart:convert';

class RestClient {
  final String baseUrl;

  RestClient(this.baseUrl);

  // Metodo GET
  Future<T> get<T>(
    String endpoint,
    //T Function(Map<String, dynamic>) fromJson,
    T Function(dynamic json) fromJson,
  ) async {
    final response = await http.get(Uri.parse('$baseUrl$endpoint'));
    return _processResponse(response, fromJson);
  }

  // Metodo POST
  Future<T> post<T>(
    String endpoint,
    dynamic data,
    //T Function(Map<String, dynamic>) fromJson,
    T Function(dynamic json) fromJson,
  ) async {
    final response = await http.post(
      Uri.parse('$baseUrl$endpoint'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(_encodeData(data)),
    );
    return _processResponse(response, fromJson);
  }

  // Metodo PUT
  Future<T> put<T>(
    String endpoint,
    dynamic data,
    //T Function(Map<String, dynamic>) fromJson,
    T Function(dynamic json) fromJson,
  ) async {
    final response = await http.put(
      Uri.parse('$baseUrl$endpoint'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(_encodeData(data)),
    );
    return _processResponse(response, fromJson);
  }

  // Metodo DELETE
  Future<T> delete<T>(
    String endpoint,
    //T Function(Map<String, dynamic>) fromJson,
    T Function(dynamic json) fromJson,
  ) async {
    final response = await http.delete(Uri.parse('$baseUrl$endpoint'));
    return _processResponse(response, fromJson);
  }

  // Helper per codificare i dati di input in base al loro tipo
  dynamic _encodeData(dynamic data) {
    if (data is Map || data is List) {
      // Assumiamo che i dati di tipo Map o List siano già in formato JSON-appropriato
      return data;
    } else if (data is String || data is num || data is bool) {
      // I dati primitivi vengono passati direttamente
      return data;
    } else {
      // Se l'oggetto ha il metodo toJson(), lo utilizziamo per serializzare
      return data.toJson();
    }
  }

  // Helper per processare la risposta
  /* T _processResponse<T>(
    http.Response response,
    T Function(Map<String, dynamic>) fromJson,
  ) {
    if (response.statusCode == 200) {
      return fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } */

  T _processResponse<T>(
    http.Response response,
    T Function(dynamic json) fromJson,
  ) {
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      if (jsonResponse is Map<String, dynamic> ||
          jsonResponse is List<dynamic>) {
        return fromJson(jsonResponse);
      } else {
        return jsonResponse;
      }
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  }
}
