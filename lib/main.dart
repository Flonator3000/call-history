import 'package:flutter/material.dart';
import 'package:call_log/call_log.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    Future<Iterable<CallLogEntry>> entries = CallLog.get();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FutureBuilder(
              future: entries,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                List<Widget> children;
                if (snapshot.hasData) {
                  children = <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: SizedBox(
                        height: 600,
                        child: ListView(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          children: getContent(snapshot),
                        ),
                      ),
                    ),
                  ];
                } else if (snapshot.hasError) {
                  children = <Widget>[
                    const Icon(
                      Icons.error_outline,
                      color: Colors.red,
                      size: 60,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Text('Error: ${snapshot.error}'),
                    ),
                  ];
                } else {
                  children = const <Widget>[
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: CircularProgressIndicator(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 16),
                      child: Text('Awaiting result...'),
                    ),
                  ];
                }
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: children,
                );
              })
        ],
      ),
    );
  }

  getContent(AsyncSnapshot snapshot) {
    List<CallLogEntry> list = snapshot.data.toList();

    final secondLIst = list.map((entry) {
      return Container(
        height: 100,
        color: Colors.amber[600],
        child: Center(child: Text(entry.number! + entry.duration!.toString())),
      );
    }).toList();

    return secondLIst;
  }
}
