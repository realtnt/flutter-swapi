import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:starwars_info/src/common_widgets/async_value_widget.dart';
import 'package:starwars_info/src/features/search/data/fake_search_repository.dart';
import 'package:starwars_info/src/features/search/presentation/search_results_widget.dart';
import 'package:starwars_info/src/models/messages/starship_messages.dart';

class StarshipSearchWidget extends ConsumerWidget {
  const StarshipSearchWidget({super.key, required this.searchTerm});
  final String searchTerm;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final starshipsValue = ref.watch(starshipsSearchStreamProvider(searchTerm));

    return AsyncValueWidget(
      value: starshipsValue,
      data: (starships) {
        return SearchResultsWidget(
          data: starships,
          messages: StarshipMessages(),
        );
      },
    );
  }
}
