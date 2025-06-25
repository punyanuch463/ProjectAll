// To parse this JSON data, do
//
//     final convert = convertFromJson(jsonString);

import 'dart:convert';

Convert convertFromJson(String str) => Convert.fromJson(json.decode(str));

String convertToJson(Convert data) => json.encode(data.toJson());

class Convert {
    Convert({
        required this.sourceAmount,
        required this.sourceUnit,
        required this.targetAmount,
        required this.targetUnit,
        required this.answer,
        required this.type,
    });

    int sourceAmount;
    String sourceUnit;
    int targetAmount;
    String targetUnit;
    String answer;
    String type;

    factory Convert.fromJson(Map<String, dynamic> json) => Convert(
        sourceAmount: json["sourceAmount"],
        sourceUnit: json["sourceUnit"],
        targetAmount: json["targetAmount"],
        targetUnit: json["targetUnit"],
        answer: json["answer"],
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "sourceAmount": sourceAmount,
        "sourceUnit": sourceUnit,
        "targetAmount": targetAmount,
        "targetUnit": targetUnit,
        "answer": answer,
        "type": type,
    };
}
