import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WordPairEdition extends StatefulWidget {
  WordPairEdition({Key? key, required WordPair pair})
      : this.pair = pair,
        super(key: key);

  final WordPair pair;

  @override
  _WordPairEditionState createState() => _WordPairEditionState();
}

class _WordPairEditionState extends State<WordPairEdition> {
  final _myControllerFirst = TextEditingController();
  final _myControllerSecond = TextEditingController();

  @override
  void initState() {
    super.initState();
    _myControllerFirst.text = widget.pair.first;
    _myControllerSecond.text = widget.pair.second;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit word"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.save,
          size: 38.0,
        ),
        onPressed: () {
          WordPair updatedWordPair =
              WordPair(_myControllerFirst.text, _myControllerSecond.text);
          Navigator.pop(context, updatedWordPair);
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Form(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField(
                    decoration: InputDecoration(labelText: "Word"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    controller: _myControllerFirst,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: "Word"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    controller: _myControllerSecond,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
