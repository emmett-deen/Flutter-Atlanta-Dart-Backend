import 'package:freezed_annotation/freezed_annotation.dart';

part 'coffee.freezed.dart';
part 'coffee.g.dart';

/// {@template coffee}
/// A data model that represents a coffee.
/// {@endtemplate}
@freezed
class Coffee with _$Coffee {
  /// {@macro coffee}
  factory Coffee({ required String id,
    required String title,
    required String description,
    required String ingredients,
    required String image,
  }) = _Coffee;

  Coffee._();

  /// Creates a Coffee instance from a map.
  factory Coffee.fromJson(Map<String, dynamic> json) => _$CoffeeFromJson(json);
}
