import 'package:ditonton/domain/entities/tv_network.dart';
import 'package:equatable/equatable.dart';

class TvNetworkModel extends Equatable {
  TvNetworkModel({
    required this.name,
    required this.id,
    required this.logoPath,
    required this.originCountry,
  });

  final String name;
  final int id;
  final String logoPath;
  final String originCountry;

  factory TvNetworkModel.fromJson(Map<String, dynamic> json) => TvNetworkModel(
        name: json["name"],
        id: json["id"],
        logoPath: json["logo_path"],
        originCountry: json["origin_country"],
      );
  TvNetwork toEntity() => TvNetwork(
        name: this.name,
        id: this.id,
        logoPath: this.logoPath,
        originCountry: this.originCountry,
      );
  @override
  List<Object?> get props => [
        name,
        id,
        logoPath,
        originCountry,
      ];
}
