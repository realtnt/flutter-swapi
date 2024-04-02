import 'package:starwars_info/src/localization/string_hardcoded.dart';
import 'package:starwars_info/src/models/messages/search_messages.dart';

class CharacterMessages extends SearchMessages {
  @override
  final String foundMessage = 'Characters found:'.hardcoded;
  @override
  final String notFoundMessage = 'No characters found.'.hardcoded;
  @override
  final String resourceName = 'Character'.hardcoded;
}
