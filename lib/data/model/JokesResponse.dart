import 'package:json_annotation/json_annotation.dart';

part 'JokesResponse.g.dart';

@JsonSerializable()
class JokesResponse {

  @JsonKey(name: "joke")
  String jokeString;

  JokesResponse(this.jokeString);

  factory JokesResponse.fromJson(Map<String, dynamic> json) =>
      _$JokesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$JokesResponseToJson(this);
}
