import 'package:equatable/equatable.dart';

class TvProductionCountry extends Equatable {
  TvProductionCountry({
    required this.iso31661,
    required this.name,
  });

  final String iso31661;
  final String name;

  @override
  List<Object?> get props => [iso31661, name];
}
