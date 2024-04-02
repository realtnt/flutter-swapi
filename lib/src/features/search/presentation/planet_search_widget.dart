import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:starwars_info/src/common_widgets/async_value_widget.dart';
import 'package:starwars_info/src/features/search/data/fake_search_repository.dart';
import 'package:starwars_info/src/features/search/presentation/search_results_widget.dart';
import 'package:starwars_info/src/models/messages/planet_messages.dart';

class PlanetSearchWidget extends ConsumerWidget {
  const PlanetSearchWidget({super.key, required this.searchTerm});
  final String searchTerm;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final planetsValue = ref.watch(planetsSearchStreamProvider(searchTerm));

    return AsyncValueWidget(
      value: planetsValue,
      data: (planets) {
        return SearchResultsWidget(
          data: planets,
          messages: PlanetMessages(),
        );
      },
    );
  }
}
