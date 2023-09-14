import 'package:json_annotation/json_annotation.dart';

part 'JokesResponse.g.dart';

@JsonSerializable()
class JokesResponse{
  String jokeString;
  JokesResponse(this.jokeString);

  factory JokesResponse.fromJson(Map<String, dynamic> json) =>JokesResponse(json["joke"]);

}