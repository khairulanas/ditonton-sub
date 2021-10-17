import '../../domain/entities/tv_created_by.dart';
import 'package:equatable/equatable.dart';

class CreatedByModel extends Equatable {
  CreatedByModel({
    this.id,
    this.creditId,
    this.name,
    this.gender,
    this.profilePath,
  });

  final int? id;
  final String? creditId;
  final String? name;
  final int? gender;
  final String? profilePath;

  factory CreatedByModel.fromJson(Map<String, dynamic> json) => CreatedByModel(
        id: json["id"] == null ? null : json["id"],
        creditId: json["credit_id"] == null ? null : json["credit_id"],
        name: json["name"] == null ? null : json["name"],
        gender: json["gender"] == null ? null : json["gender"],
        profilePath: json["profile_path"] == null ? null : json["profile_path"],
      );

  CreatedBy toEntity() => CreatedBy(
      id: this.id,
      creditId: this.creditId,
      name: this.name,
      gender: this.gender,
      profilePath: this.profilePath);

  @override
  List<Object?> get props => [
        id,
        creditId,
        name,
        gender,
        profilePath,
      ];
}
