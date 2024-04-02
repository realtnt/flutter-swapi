import 'package:starwars_info/src/localization/string_hardcoded.dart';
import 'package:starwars_info/src/models/messages/search_messages.dart';

class PlanetMessages extends SearchMessages {
  @override
  final String foundMessage = 'Planets found:'.hardcoded;
  @override
  final String notFoundMessage = 'No planets found.'.hardcoded;
  @override
  final String resourceName = 'Planet'.hardcoded;
}
