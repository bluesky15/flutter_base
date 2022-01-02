import 'package:flutter/material.dart';
import 'package:flutter_base/home/home_bloc.dart';
import 'dart:developer' as developer;

const String tag = "HomePage";

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final counterBloc = HomeBloc();
  @override
  void dispose() {
    counterBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    developer.log(tag, name: '---Widgets Build method called ----');
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            StreamBuilder(
                stream: counterBloc.counterStream,
                initialData: 0,
                builder: (context, snapshot) {
                  return Text(
                    '${snapshot.data}',
                    style: Theme.of(context).textTheme.headline4,
                  );
                }),
          ],
        ),
      ),
      floatingActionButton: Row(children: [
        FloatingActionButton(
          onPressed: () {
            counterBloc.eventSink.add(HomeAction.increment);
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
        FloatingActionButton(
          onPressed: () {
            counterBloc.eventSink.add(HomeAction.decrement);
          },
          tooltip: 'Increment',
          child: const Icon(Icons.remove),
        ),
        FloatingActionButton(
          onPressed: () {
            counterBloc.eventSink.add(HomeAction.reset);
          },
          tooltip: 'Increment',
          child: const Icon(Icons.repeat),
        ),
      ]), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}