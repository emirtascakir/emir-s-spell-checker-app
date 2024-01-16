class CorrectionModel {
  final String correction;

  CorrectionModel({required this.correction});

  factory CorrectionModel.fromJson(Map<String, dynamic> json) {
    return CorrectionModel(
      correction: json['correction'] ?? "",
    );
  }

  @override
  String toString() {
    return 'CorrectionResponse{correction: $correction}';
  }
}
