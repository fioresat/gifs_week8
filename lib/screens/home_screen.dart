import 'package:flutter/material.dart';
import 'package:gifs_week8/screens/widgets/gif_card.dart';
import 'package:gifs_week8/screens/widgets/search_form.dart';

import '../data/gif_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _gifService = GifService();

  String _phrase = '';
  Color _color = Colors.green;
  List<String> _pictures = [];

  @override
  void initState() {
    super.initState();
    //_changePhrase(_phrase);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: const [0, 1.0],
            colors: [_color, Colors.white],
          ),
        ),
        child: Center(
          child: _content,
        ),
      ),
    );
  }

  Widget get _content =>
      SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
            ),
            SearchForm(onSearch: _changePhrase),
            if (_phrase != "" && _pictures.isNotEmpty) gifTable(),
            if (_phrase != "" && _pictures.isEmpty) mess(),
          ],
        ),
      );

  void _changePhrase(String phrase) async {
    final dataDecoded = await _gifService.getGifByName(phrase);
    _updateData(dataDecoded);
    setState(() {
      _phrase = phrase;
    });
  }

  void _updateData(gifData) {
    setState(() {
      if (gifData != null) {
        _pictures = [];
        for (int i = 0; i < gifData['data'].length; i++) {
          _pictures
              .add(gifData['data'][i]['images']['original']['url'].toString());
        }
        print(_pictures);
      } else {
        print('\nsomething wrong in _updateData\n');
      }
    });
  }

  Widget gifTable() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < _pictures.length / 2; i++)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int j = i * 2; j < i * 2 + 2; j++)
                GifCard(picture: _pictures[j]),
            ],
          )
      ],
    );
  }

  Widget mess() {
    return Container(
      height: 40,
      width: 300,
      padding: EdgeInsets.only(top:10),
      decoration: const BoxDecoration(
        color: Colors.pinkAccent,
      ),
      child: const Text(
        'Try another request',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.white),
      ),

    );
  }
}
