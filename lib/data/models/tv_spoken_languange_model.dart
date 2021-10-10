import 'package:ditonton/domain/entities/tv_spoken_languange.dart';
import 'package:equatable/equatable.dart';

class TvSpokenLanguageModel extends Equatable {
  TvSpokenLanguageModel({
    required this.englishName,
    required this.iso6391,
    required this.name,
  });

  final String englishName;
  final String iso6391;
  final String name;

  factory TvSpokenLanguageModel.fromJson(Map<String, dynamic> json) =>
      TvSpokenLanguageModel(
        englishName: json["english_name"],
        iso6391: json["iso_639_1"],
        name: json["name"],
      );

  // Map<String, dynamic> toJson() => {
  //       "english_name": englishName,
  //       "iso_639_1": iso6391,
  //       "name": name,
  //     };
  TvSpokenLanguage toEntity() => TvSpokenLanguage(
        englishName: this.englishName,
        iso6391: this.iso6391,
        name: this.name,
      );
  @override
  List<Object?> get props => [englishName, iso6391, name];
}
