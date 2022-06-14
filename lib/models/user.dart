import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user.freezed.dart';
part'user.g.dart';

@freezed

abstract class User with _$User {
  factory User({
    required String email,
    required String name,
    required String position,
    required String telephone,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}