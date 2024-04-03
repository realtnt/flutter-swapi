import 'package:flutter/material.dart';
import 'package:starwars_info/src/models/messages/search_messages.dart';
import 'package:starwars_info/src/models/search_resource.dart';

class SearchResultsWidget extends StatelessWidget {
  const SearchResultsWidget(
      {super.key, required this.data, required this.messages});
  final List<SearchResource> data;
  final SearchMessages messages;

  @override
  Widget build(BuildContext context) {
    return data.isEmpty
        ? Center(
            child: Text(
              messages.notFoundMessage,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          )
        : Center(
            child: Column(
              children: [
                Text(
                  messages.foundMessage,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                ListView.separated(
                  separatorBuilder: (context, index) => const Divider(
                    indent: 16,
                    endIndent: 16,
                  ),
                  shrinkWrap: true,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final searchInfo = data[index].getInfo();
                    final title = searchInfo.title;
                    final infoItems = searchInfo.data;
                    return ListTile(
                      title: Column(
                        children: [
                          Text(
                            title,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: infoItems.length,
                            itemBuilder: (context, index) {
                              final key = infoItems.keys.elementAt(index);
                              final value = infoItems[key];
                              return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      key,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 16.0),
                                      child: value is List
                                          ? ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: value.length,
                                              itemBuilder: (context, index) =>
                                                  Text(value[index]),
                                            )
                                          : Text('$value'),
                                    ),
                                  ]);
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          );
  }
}
