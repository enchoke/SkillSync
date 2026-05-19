import 'package:equatable/equatable.dart';

class ApiResponseModel extends Equatable {
  final String? status;
  final num? responseCode;
  final dynamic result;

  const ApiResponseModel({
    this.status,
    this.responseCode,
    this.result,
  });

  @override
  List<Object?> get props => [
    status,
    responseCode,
    result,
      ];

  ApiResponseModel copyWith({
    String? status,
    num? responseCode,
    dynamic result,
  }) {
    return ApiResponseModel(
      status: status ?? this.status,
      responseCode: responseCode ?? this.responseCode,
      result: result ?? this.result,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Status': status,
      'responseCode': responseCode,
      'Result': result,
    };
  }

  factory ApiResponseModel.fromMap(Map<String, dynamic> map) {
    return ApiResponseModel(
      status: map['Status'] as String?,
      responseCode: map['ResponseCode'] as num?,
      result: map['Result'],
    );
  }
}
