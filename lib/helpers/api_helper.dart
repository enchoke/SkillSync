import 'dart:convert';
import 'package:skillsync/barrel_file.dart';
import 'package:skillsync/models/api_response_model.dart';
import 'package:skillsync/models/error_model.dart';
import 'package:http/http.dart' as http;

class ApiHelper {
  static final ApiHelper _instance = ApiHelper._internal();

  factory ApiHelper() => _instance;

  ApiHelper._internal();

  final String _baseUrl = cIsLive ? cLive : cDebug;
  final Map<String, String> _headers = {'Content-Type': 'application/json'};

  Future<ApiResponseModel> get({required String endpoint, Map<String, String>? headers}) async {
    try {
      Uri url = Uri.parse('$_baseUrl$endpoint');
      http.Response response = await http.get(url, headers: headers ?? _headers);

      if (response.statusCode == 200) {
        dynamic result = jsonDecode(response.body);
        if (result is Map<String, dynamic> && result['error'] != null) {
          throw (result['error']['message']);
        }
        ApiResponseModel.fromMap(result);
        return ApiResponseModel.fromMap(result);
      } else {
        String stackTrace = 'Headers:${headers ?? _headers}\nEndpoint: $endpoint';
        sl.generalCubit.log(ErrorModel(error: response.toString(), stackTrace: stackTrace));
        throw ('${response.reasonPhrase}');
      }
    } catch (error) {
      rethrow;
    }
  }

  Future<ApiResponseModel> post({required Map<String, dynamic> bodyMap, required String endpoint, Map<String, String>? headers}) async {
    try {
      String body = jsonEncode(bodyMap);
      final url = Uri.parse('$_baseUrl$endpoint');
      Map<String, String> fullHeaders = {
        ..._headers,
        if (headers != null) ...headers,
      };
      http.Response response = await http.post(
        url,
        headers: fullHeaders,
        body: body,
      );
      if (response.statusCode == 200) {
        if (response.headers['content-type'] == 'application/pdf') {
          ApiResponseModel result = ApiResponseModel(status: "Success", responseCode: response.statusCode, result: response.bodyBytes);
          return result;
        }
        dynamic result = jsonDecode(response.body);
        if (result is Map<String, dynamic> && result['error'] != null) {
          throw (result['error']['message']);
        }
        ApiResponseModel.fromMap(result);
        return ApiResponseModel.fromMap(result);
      } else {
        String decodedString = utf8.decode(response.bodyBytes);
        String stackTrace = 'Headers:$fullHeaders\nEndpoint: $endpoint\nbody: $body';
        sl.generalCubit.log(ErrorModel(error: decodedString, stackTrace: stackTrace));
        throw (decodedString);
      }
    } catch (error) {
      rethrow;
    }
  }
}
