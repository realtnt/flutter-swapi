import 'package:starwars_info/src/localization/string_hardcoded.dart';
import 'package:starwars_info/src/models/messages/search_messages.dart';

class StarshipMessages extends SearchMessages {
  @override
  final String foundMessage = 'Starships found:'.hardcoded;
  @override
  final String notFoundMessage = 'No starships found.'.hardcoded;
  @override
  final String resourceName = 'Starship'.hardcoded;
}
