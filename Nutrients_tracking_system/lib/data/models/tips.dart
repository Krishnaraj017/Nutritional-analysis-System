import 'package:freezed_annotation/freezed_annotation.dart';

part 'tips.g.dart';

@JsonSerializable()
class Tips {
  String message;
  String tip;
  int status;

  Tips(this.message, this.tip, this.status);

  factory Tips.fromJson(Map<String, dynamic> json) => _$TipsFromJson(json);

  Map<String, dynamic> toJson() => _$TipsToJson(this);
}
