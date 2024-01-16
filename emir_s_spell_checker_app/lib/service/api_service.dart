import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'package:emir_s_spell_checker_app/constants/app_constants.dart';
import 'package:emir_s_spell_checker_app/models/correction_model.dart';

class ApiService {
  Future<CorrectionModel> sendCorrectionRequest(String text) async {
    Map<String, String> headers = {
      "Authorization": "Token $API_KEY",
      "Content-Type": "application/json",
    };

    String jsonData = '{"text":"$text"}';

    try {
      final response = await http.post(
        Uri.parse(URL),
        headers: headers,
        body: jsonData,
      );

      if (response.statusCode == HttpStatus.ok) {
        final Map<String, dynamic> responseBody = json.decode(response.body);
        final CorrectionModel correctionResponse =
            CorrectionModel.fromJson(responseBody);
        inspect(correctionResponse);
        return correctionResponse;
      } else {
        print("Error: ${response.statusCode}, ${response.body}");
        throw Exception("Error: ${response.statusCode}, ${response.body}");
      }
    } catch (e) {
      print("Exception: $e");
      throw Exception("Exception: $e");
    }
  }
}
