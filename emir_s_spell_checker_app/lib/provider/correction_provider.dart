import 'package:emir_s_spell_checker_app/models/correction_model.dart';
import 'package:flutter/material.dart';

import 'package:emir_s_spell_checker_app/service/api_service.dart';

class CorrectionProvider extends ChangeNotifier {
  final _service = ApiService();
  bool isLoading = false;
  CorrectionModel response = CorrectionModel(correction: "");
  Future<void> getResponse(String text) async {
    isLoading = true;
    notifyListeners();
    response = await _service.sendCorrectionRequest(text);
    isLoading = false;
    notifyListeners();
  }
}
