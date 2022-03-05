import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Text('Hello'),
      appBar: AppBar(
        title: Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          padding: const EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.transparent,
              ),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(10)
          ),
          child: const TextField(
            textInputAction: TextInputAction.search,
            autofocus: true,
            decoration: InputDecoration(hintText: "Search here"),
          ),
        ),
      ),
    );
  }
}
