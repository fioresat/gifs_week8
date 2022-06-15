import 'package:flutter/material.dart';

class SearchForm extends StatefulWidget {
  final Function(String) onSearch;

  const SearchForm({
    Key? key,
    required this.onSearch,
  }) : super(key: key);

  @override
  createState() => _SearchFormState();
}

class _SearchFormState extends State<SearchForm> {
  final _phraseController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, top: 0, right: 20, bottom: 50),
      padding: const EdgeInsets.only(left: 20, top: 5, right: 5, bottom: 00),
      height: 50,
      width: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(3),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 3,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: TextField(
              controller: _phraseController,
              decoration:
                  const InputDecoration.collapsed(hintText: 'Search Giphy'),
              onSubmitted: (String phrase) => widget.onSearch(phrase),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.search),
            color: Colors.green,
            onPressed: () {
              widget.onSearch(_phraseController.text);
            },
          )
        ],
      ),
    );
  }
}
