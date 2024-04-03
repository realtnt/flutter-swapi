import 'package:flutter/material.dart';
import 'package:starwars_info/src/features/search/presentation/character_search_widget.dart';
import 'package:starwars_info/src/features/search/presentation/planet_search_widget.dart';
import 'package:starwars_info/src/features/search/presentation/starship_search_widget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SWAPI'),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Search',
                ),
                onChanged: (value) {
                  // Update the state of the widget to reflect the new text.
                  setState(() {});
                },
              ),
            ),
            _controller.text.length > 2
                ? Column(
                    children: [
                      CharacterSearchWidget(searchTerm: _controller.text),
                      PlanetSearchWidget(searchTerm: _controller.text),
                      StarshipSearchWidget(searchTerm: _controller.text),
                    ],
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
