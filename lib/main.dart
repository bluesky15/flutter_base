import 'package:flutter/material.dart';
import 'package:flutter_base/helper.dart';
import 'package:visibility_detector/visibility_detector.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final containerKey = GlobalKey();
  final contkey = GlobalKey();
  final containerKey2 = GlobalKey();
  var isVisible = true;

  changeState() {
    setState(() {
      isVisible = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: VisibilityDetector(
          key: contkey,
          onVisibilityChanged: (visibilityInfo) {
            var visiblePercentage = visibilityInfo.visibleFraction * 100;
            debugPrint(
                'Widget ${visibilityInfo.key} is ${visiblePercentage}% visible');
          },
          child: Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                VisibilityDetector(
                  key: GlobalKey(),
                  onVisibilityChanged: (visibilityInfo){
                    var visiblePercentage = visibilityInfo.visibleFraction * 100;
                    debugPrint(
                        'Widget ${visibilityInfo.key} is ${visiblePercentage}% visible');
                  },
                  child: InkWell(
                      key: containerKey,
                      child: Text("hello"),
                      onTap: () {
                        //printWidgetPosition(containerKey);
                        changeState();
                      }),
                ),
                if (isVisible)
                  VisibilityDetector(
                    key: GlobalKey(),
                    onVisibilityChanged: (visibilityInfo){
                      var visiblePercentage = visibilityInfo.visibleFraction * 100;
                      debugPrint(
                          'Widget ${visibilityInfo.key} is ${visiblePercentage}% visible');
                    },
                    child: InkWell(
                        key: containerKey2,
                        child: Text("hello world"),
                        onTap: () {
                          printWidgetPosition(containerKey2);
                        }),
                  )
              ],
            ),
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void printWidgetPosition(GlobalKey key) {
    print('absolute coordinates on screen: ${key.globalPaintBounds}');
  }
}
