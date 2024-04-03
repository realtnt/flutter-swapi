import 'package:starwars_info/src/localization/string_hardcoded.dart';
import 'package:starwars_info/src/models/search_info.dart';
import 'package:starwars_info/src/models/search_resource.dart';

class Character extends SearchResource {
  final String name;
  final String height;
  final String mass;
  final String hairColor;
  final String skinColor;
  final String eyeColor;
  final String birthYear;
  final String gender;
  final String homeworld;
  final List<String> films;
  final List<String> species;
  final List<String> vehicles;
  final List<String> starships;
  final String created;
  final String edited;
  final String url;

  Character({
    required this.name,
    required this.height,
    required this.mass,
    required this.hairColor,
    required this.skinColor,
    required this.eyeColor,
    required this.birthYear,
    required this.gender,
    required this.homeworld,
    required this.films,
    required this.species,
    required this.vehicles,
    required this.starships,
    required this.created,
    required this.edited,
    required this.url,
  });

  // Method to create a Character object from a Map (useful for JSON deserialization)
  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      name: json['name'],
      height: json['height'],
      mass: json['mass'],
      hairColor: json['hair_color'],
      skinColor: json['skin_color'],
      eyeColor: json['eye_color'],
      birthYear: json['birth_year'],
      gender: json['gender'],
      homeworld: json['homeworld'],
      films: List<String>.from(json['films']),
      species: List<String>.from(json['species']),
      vehicles: List<String>.from(json['vehicles']),
      starships: List<String>.from(json['starships']),
      created: json['created'],
      edited: json['edited'],
      url: json['url'],
    );
  }

  // Method to convert a Character object back to a Map (useful for JSON serialization)
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'height': height,
      'mass': mass,
      'hair_color': hairColor,
      'skin_color': skinColor,
      'eye_color': eyeColor,
      'birth_year': birthYear,
      'gender': gender,
      'homeworld': homeworld,
      'films': films,
      'species': species,
      'vehicles': vehicles,
      'starships': starships,
      'created': created,
      'edited': edited,
      'url': url,
    };
  }

  @override
  SearchInfo getInfo() {
    //TODO - Implement real look ups
    final List<String> starshipNames = [
      'starship 1',
      'starship 2',
      'starship 3',
    ];
    final result = SearchInfo(
      title: name,
      data: {
        "Gender".hardcoded: gender,
        "Starships Piloted".hardcoded: starshipNames,
      },
    );
    return result;
  }
}
