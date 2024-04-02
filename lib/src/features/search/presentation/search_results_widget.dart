import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                ListView.builder(
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
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          // TODO: Needs fixing
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: infoItems.length,
                            itemBuilder: (context, index) {
                              final key = infoItems.keys.elementAt(index);
                              final value = infoItems[key];
                              return ListTile(
                                title: Text('$key: $value'),
                              );
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
