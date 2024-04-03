import 'package:starwars_info/src/localization/string_hardcoded.dart';
import 'package:starwars_info/src/models/search_info.dart';
import 'package:starwars_info/src/models/search_resource.dart';

class Starship extends SearchResource {
  final String name;
  final String model;
  final String manufacturer;
  final String costInCredits;
  final String length;
  final String maxAtmospheringSpeed;
  final String crew;
  final String passengers;
  final String cargoCapacity;
  final String consumables;
  final String hyperdriveRating;
  final String MGLT;
  final String starshipClass;
  final List<String> pilots;
  final List<String> films;
  final String created;
  final String edited;
  final String url;

  Starship({
    required this.name,
    required this.model,
    required this.manufacturer,
    required this.costInCredits,
    required this.length,
    required this.maxAtmospheringSpeed,
    required this.crew,
    required this.passengers,
    required this.cargoCapacity,
    required this.consumables,
    required this.hyperdriveRating,
    required this.MGLT,
    required this.starshipClass,
    required this.pilots,
    required this.films,
    required this.created,
    required this.edited,
    required this.url,
  });

  factory Starship.fromJson(Map<String, dynamic> json) {
    return Starship(
      name: json['name'],
      model: json['model'],
      manufacturer: json['manufacturer'],
      costInCredits: json['cost_in_credits'],
      length: json['length'],
      maxAtmospheringSpeed: json['max_atmosphering_speed'],
      crew: json['crew'],
      passengers: json['passengers'],
      cargoCapacity: json['cargo_capacity'],
      consumables: json['consumables'],
      hyperdriveRating: json['hyperdrive_rating'],
      MGLT: json['MGLT'],
      starshipClass: json['starship_class'],
      pilots: List<String>.from(json['pilots']),
      films: List<String>.from(json['films']),
      created: json['created'],
      edited: json['edited'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'model': model,
      'manufacturer': manufacturer,
      'cost_in_credits': costInCredits,
      'length': length,
      'max_atmosphering_speed': maxAtmospheringSpeed,
      'crew': crew,
      'passengers': passengers,
      'cargo_capacity': cargoCapacity,
      'consumables': consumables,
      'hyperdrive_rating': hyperdriveRating,
      'MGLT': MGLT,
      'starship_class': starshipClass,
      'pilots': pilots,
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
        "Model".hardcoded: model,
        "Manufacturer".hardcoded: manufacturer,
        "Passengers".hardcoded: passengers,
      },
    );
    return result;
  }
}
