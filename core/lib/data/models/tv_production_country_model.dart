import '../../domain/entities/tv_production_country.dart';
import 'package:equatable/equatable.dart';

class TvProductionCountryModel extends Equatable {
  TvProductionCountryModel({
    required this.iso31661,
    required this.name,
  });

  final String iso31661;
  final String name;

  factory TvProductionCountryModel.fromJson(Map<String, dynamic> json) =>
      TvProductionCountryModel(
        iso31661: json["iso_3166_1"],
        name: json["name"],
      );
  TvProductionCountry toEntity() =>
      TvProductionCountry(iso31661: this.iso31661, name: this.name);
  @override
  List<Object?> get props => [iso31661, name];
}
