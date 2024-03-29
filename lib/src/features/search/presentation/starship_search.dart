import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:starwars_info/src/common_widgets/async_value_widget.dart';
import 'package:starwars_info/src/features/search/data/fake_search_repository.dart';
import 'package:starwars_info/src/localization/string_hardcoded.dart';

class StarshipSearch extends ConsumerWidget {
  const StarshipSearch({super.key, required this.searchTerm});
  final String searchTerm;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final starshipsValue = ref.watch(starshipsSearchStreamProvider(searchTerm));

    return AsyncValueWidget(
      value: starshipsValue,
      data: (starships) {
        return starships.isEmpty
            ? Center(
                child: Text(
                  "No starship found for '$searchTerm'".hardcoded,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              )
            : Center(
                child: Column(
                  children: [
                    Text('Starships found:'.hardcoded),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: starships.length,
                      itemBuilder: (context, index) {
                        final name = starships[index].name;
                        final model = starships[index].model;
                        final manufacturer = starships[index].manufacturer;
                        final passengers =
                            starships[index].passengers.toString();
                        return ListTile(
                          title: Column(
                            children: [
                              Text(
                                name,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              Text(
                                model,
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                              Text(
                                manufacturer,
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                              Text(
                                passengers,
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
