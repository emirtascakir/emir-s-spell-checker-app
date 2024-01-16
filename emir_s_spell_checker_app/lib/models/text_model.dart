import 'package:emir_s_spell_checker_app/models/nlpcloud_model.dart';

class Text {
  Nlpcloud? nlpcloud;

  Text({this.nlpcloud});

  Text.fromJson(Map<String, dynamic> json) {
    nlpcloud = json['nlpcloud'] != null
        ? new Nlpcloud.fromJson(json['nlpcloud'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.nlpcloud != null) {
      data['nlpcloud'] = this.nlpcloud!.toJson();
    }
    return data;
  }
}
