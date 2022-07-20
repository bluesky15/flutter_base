import 'package:flutter/material.dart';
import 'package:flutter_base/helper.dart';
import 'package:visibility_detector/visibility_detector.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(
    MyApp(
      items: List<ListItem>.generate(
        1000,
        (i) => i % 6 == 0
            ? HeadingItem('Heading $i')
            : MessageItem('Sender $i', 'Message body $i'),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final List<ListItem> items;

  const MyApp({key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const title = 'Mixed List';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body: ListView.builder(
          // Let the ListView know how many items it needs to build.
          itemCount: items.length,
          // Provide a builder function. This is where the magic happens.
          // Convert each item into a widget based on the type of item it is.
          itemBuilder: (context, index) {
            final item = items[index];

            return VisibilityDetector(
              key: GlobalKey(),
              onVisibilityChanged: (visibilityInfo) {
                var visiblePercentage = visibilityInfo.visibleFraction * 100;
                if(visiblePercentage==100){
                  debugPrint('Widget ${visibilityInfo.key} is 100% visible');
                }
                // debugPrint(
                //     'Widget ${visibilityInfo.key} is ${visiblePercentage}% visible');
              },
              child: ListTile(
                title: item.buildTitle(context),
                subtitle: item.buildSubtitle(context),
              ),
            );
          },
        ),
      ),
    );
  }
}

/// The base class for the different types of items the list can contain.
abstract class ListItem {
  /// The title line to show in a list item.
  Widget buildTitle(BuildContext context);

  /// The subtitle line, if any, to show in a list item.
  Widget buildSubtitle(BuildContext context);
}

/// A ListItem that contains data to display a heading.
class HeadingItem implements ListItem {
  final String heading;

  HeadingItem(this.heading);

  @override
  Widget buildTitle(BuildContext context) {
    return Container(
      key: GlobalKey(),
      child: Text(
        heading,
        style: Theme.of(context).textTheme.headline5,
      ),
    );
  }

  @override
  Widget buildSubtitle(BuildContext context) => const SizedBox.shrink();
}

/// A ListItem that contains data to display a message.
class MessageItem implements ListItem {
  final String sender;
  final String body;

  MessageItem(this.sender, this.body);

  @override
  Widget buildTitle(BuildContext context) =>
      Container(key: GlobalKey(), child: Text(sender));

  @override
  Widget buildSubtitle(BuildContext context) => Container(
        child: Text(body),
        key: GlobalKey(),
      );
}
