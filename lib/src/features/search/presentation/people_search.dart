import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:starwars_info/src/common_widgets/async_value_widget.dart';
import 'package:starwars_info/src/features/search/data/fake_search_repository.dart';
import 'package:starwars_info/src/localization/string_hardcoded.dart';

class PeopleSearch extends ConsumerWidget {
  const PeopleSearch({super.key, required this.searchTerm});
  final String searchTerm;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final charactersValue = ref.watch(peopleSearchStreamProvider(searchTerm));

    return AsyncValueWidget(
      value: charactersValue,
      data: (characters) {
        return characters.isEmpty
            ? Center(
                child: Text(
                  "No starship found for $searchTerm'".hardcoded,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              )
            : Center(
                child: Column(
                  children: [
                    Text(
                      'Characters found:'.hardcoded,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: characters.length,
                      itemBuilder: (context, index) {
                        final name = characters[index].name;
                        final gender = characters[index].gender;
                        final starshipsPiloted =
                            characters[index].starships.length.toString();
                        return ListTile(
                          title: Column(
                            children: [
                              Text(
                                name,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              Text(
                                gender,
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                              Text(
                                starshipsPiloted,
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
