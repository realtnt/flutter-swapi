import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:starwars_info/src/common_widgets/async_value_widget.dart';
import 'package:starwars_info/src/features/search/data/fake_search_repository.dart';
import 'package:starwars_info/src/features/search/presentation/search_results_widget.dart';
import 'package:starwars_info/src/models/messages/character_messages.dart';

class CharacterSearchWidget extends ConsumerWidget {
  const CharacterSearchWidget({super.key, required this.searchTerm});
  final String searchTerm;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final charactersValue =
        ref.watch(charactersSearchStreamProvider(searchTerm));

    return AsyncValueWidget(
      value: charactersValue,
      data: (characters) {
        return SearchResultsWidget(
          data: characters,
          messages: CharacterMessages(),
        );
      },
    );
  }
}
