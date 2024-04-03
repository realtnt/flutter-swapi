import 'package:starwars_info/src/localization/string_hardcoded.dart';
import 'package:starwars_info/src/models/search_resource.dart';
import 'package:starwars_info/src/models/search_info.dart';

class Planet extends SearchResource {
  final String name;
  final String rotationPeriod;
  final String orbitalPeriod;
  final String diameter;
  final String climate;
  final String gravity;
  final String terrain;
  final String surfaceWater;
  final String population;
  final List<String> residents;
  final List<String> films;
  final String created;
  final String edited;
  final String url;

  Planet({
    required this.name,
    required this.rotationPeriod,
    required this.orbitalPeriod,
    required this.diameter,
    required this.climate,
    required this.gravity,
    required this.terrain,
    required this.surfaceWater,
    required this.population,
    required this.residents,
    required this.films,
    required this.created,
    required this.edited,
    required this.url,
  });

  // Method to create a Planet object from a Map (useful for JSON deserialization)
  factory Planet.fromJson(Map<String, dynamic> json) {
    return Planet(
      name: json['name'],
      rotationPeriod: json['rotation_period'],
      orbitalPeriod: json['orbital_period'],
      diameter: json['diameter'],
      climate: json['climate'],
      gravity: json['gravity'],
      terrain: json['terrain'],
      surfaceWater: json['surface_water'],
      population: json['population'],
      residents: List<String>.from(json['residents']),
      films: List<String>.from(json['films']),
      created: json['created'],
      edited: json['edited'],
      url: json['url'],
    );
  }

  // Method to convert a Planet object back to a Map (useful for JSON serialization)
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'rotation_period': rotationPeriod,
      'orbital_period': orbitalPeriod,
      'diameter': diameter,
      'climate': climate,
      'gravity': gravity,
      'terrain': terrain,
      'surface_water': surfaceWater,
      'population': population,
      'residents': residents,
      'films': films,
      'created': created,
      'edited': edited,
      'url': url,
    };
  }

  @override
  SearchInfo getInfo() {
    final result = SearchInfo(
      title: name,
      data: {
        "Diameter".hardcoded: diameter,
        "Population".hardcoded: population,
      },
    );
    return result;
  }
}
