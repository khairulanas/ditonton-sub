import 'package:equatable/equatable.dart';

class TvSpokenLanguage extends Equatable {
  TvSpokenLanguage({
    required this.englishName,
    required this.iso6391,
    required this.name,
  });

  final String englishName;
  final String iso6391;
  final String name;

  @override
  List<Object?> get props => [englishName, iso6391, name];
}
