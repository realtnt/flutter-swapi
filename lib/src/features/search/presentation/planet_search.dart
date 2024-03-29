import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:starwars_info/src/common_widgets/async_value_widget.dart';
import 'package:starwars_info/src/features/search/data/fake_search_repository.dart';
import 'package:starwars_info/src/localization/string_hardcoded.dart';

class PlanetSearch extends ConsumerWidget {
  const PlanetSearch({super.key, required this.searchTerm});
  final String searchTerm;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final planetsValue = ref.watch(planetsSearchStreamProvider(searchTerm));

    return AsyncValueWidget(
      value: planetsValue,
      data: (planets) {
        return planets.isEmpty
            ? Center(
                child: Text(
                  "No planets found for '$searchTerm'".hardcoded,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              )
            : Center(
                child: Column(
                  children: [
                    Text('Planets found:'.hardcoded),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: planets.length,
                      itemBuilder: (context, index) {
                        final name = planets[index].name;
                        final diameter = planets[index].diameter.toString();
                        final population = planets[index].population.toString();
                        return ListTile(
                          title: Column(
                            children: [
                              Text(
                                name,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              Text(
                                diameter,
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                              Text(
                                population,
                                style: Theme.of(context).textTheme.labelLarge,
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
      },
    );
  }
}
