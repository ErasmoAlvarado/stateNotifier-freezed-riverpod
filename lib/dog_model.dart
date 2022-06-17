import 'package:equatable/equatable.dart';
import 'dart:convert';

DogModel dogModelFromJson(String str) => DogModel.fromJson(json.decode(str));

String dogModelToJson(DogModel data) => json.encode(data.toJson());

class DogModel extends Equatable {
  DogModel({
    required this.message,
    required this.status,
  });

  String message;
  String status;

  factory DogModel.fromJson(Map<String, dynamic> json) => DogModel(
        message: json["message"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
      };

  @override
  List<Object?> get props => [status, message];
}
