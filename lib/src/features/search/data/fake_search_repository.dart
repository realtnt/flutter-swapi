import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:starwars_info/src/constants/test_characters.dart';
import 'package:starwars_info/src/constants/test_planets.dart';
import 'package:starwars_info/src/constants/test_starships.dart';
import 'package:starwars_info/src/models/character.dart';
import 'package:starwars_info/src/models/planet.dart';
import 'package:starwars_info/src/models/starship.dart';

class FakeSearchRepository {
  final characters = TestCharacters.processJson();
  final planets = TestPlanets.processJson();
  final starships = TestStarships.processJson();

  Stream<List<Character>> searchPeople(String name) async* {
    yield characters.where((element) => element.name.contains(name)).toList();
  }

  List<Character> searchPeopleSync(String name) {
    return characters.where((element) => element.name.contains(name)).toList();
  }

  Stream<List<Planet>> searchPlanets(String name) async* {
    yield planets.where((element) => element.name.contains(name)).toList();
  }

  Stream<List<Starship>> searchStarships(String name) async* {
    yield starships.where((element) => element.name.contains(name)).toList();
  }
}

// Providers

final searchRepositoryProvider = Provider<FakeSearchRepository>((ref) {
  return FakeSearchRepository();
});

final charactersSearchStreamProvider =
    StreamProvider.family.autoDispose<List<Character>, String>((ref, name) {
  final searchRepository = ref.watch(searchRepositoryProvider);
  // final link = ref.keepAlive();
  // Timer(const Duration(seconds: 10), () => link.close());
  return searchRepository.searchPeople(name);
});

final planetsSearchStreamProvider =
    StreamProvider.family.autoDispose<List<Planet>, String>((ref, name) {
  final searchRepository = ref.watch(searchRepositoryProvider);
  final link = ref.keepAlive();
  Timer(const Duration(seconds: 10), () => link.close());
  return searchRepository.searchPlanets(name);
});

final starshipsSearchStreamProvider =
    StreamProvider.family.autoDispose<List<Starship>, String>((ref, name) {
  final searchRepository = ref.watch(searchRepositoryProvider);
  final link = ref.keepAlive();
  Timer(const Duration(seconds: 10), () => link.close());
  return searchRepository.searchStarships(name);
});
