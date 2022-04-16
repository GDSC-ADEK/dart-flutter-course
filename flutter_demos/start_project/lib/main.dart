import 'package:flutter/material.dart';
import 'dart:math';

var styles = {
  "normal": TextStyle(),
  "emphasis": TextStyle(fontWeight: FontWeight.bold, fontSize: 14)
};

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
        // This is the theme of your application.
        //
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'SomeDEmo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class AppDrawer extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      child: Drawer(
        child: ListView(
          children: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TextScreen()));
              },
              child: ListTile(
                title: Text('text, container'),
              ),
            ),
            Divider(),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Buttons()));
              },
              child: ListTile(
                title: Text('buttons'),
              ),
            ),
            Divider(),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Layout()));
              },
              child: ListTile(
                title: Text('layout'),
              ),
            ),
            Divider(),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MemberScreen()));
              },
              child: ListTile(
                title: Text('members'),
              ),
            ),
            Divider(),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Streams()));
              },
              child: ListTile(
                title: Text('streams'),
              ),
            ),
            Divider(),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FutureScreen()));
              },
              child: ListTile(
                title: Text('futures'),
              ),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}

class TextScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: AppDrawer(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Some text"),
              Text("Some colored text", style: styles["emphasis"]),
              Image.network(
                "https://testimages.org/img/testimages_screenshot.jpg",
                height: 200,
                width: 300,
              )
            ],
          ),
        ));
  }
}

class Buttons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: AppDrawer(), // the  navigation drawer
        appBar: AppBar(title: Text("Buttons")), // the title
        body: Center(
          // the body
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                  onPressed: () {}, child: Icon(Icons.hourglass_empty)),
              FlatButton(
                onPressed: () {},
                child: Text(" Abutton"),
                color: Colors.red,
              ),
              // deprecated now
              IconButton(onPressed: () {}, icon: Icon(Icons.email)),
            ],
          ),
        ));
  }
}

class Layout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: AppDrawer(), // the  navigation drawer
        appBar: AppBar(title: Text("layout")), // the title
        body: Center(
            // the body
            child: Container(
          child: Column(
            children: [
              Text("row"),
              Text("row"),
              Text("row"),
              Text("row"),
              Text("row"),
              Row(
                children: [
                  Text("column  "),
                  Text("column "),
                  Text("column "),
                  Text("column ")
                ],
              )
            ],
          ),
        )));
  }
}

class MemberScreen extends StatelessWidget {
  final members = [
    Member("sagar", "Electrotechniek", "Informatica", 2018),
    Member("sagar", "Electrotechniek", "Informatica", 2018),
    Member("sagar", "Electrotechniek", "Informatica", 2018)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: AppDrawer(), // the  navigation drawer
        appBar: AppBar(title: Text("layout")), // the title
        body: ListView.builder(
            itemCount: members.length,
            itemBuilder: (context, i) => Card(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Padding(
                    padding: EdgeInsets.all(2),
                    child: Column(children: [
                      Text(
                          "I'm ${members[i].naam}, I'm a ${members[i].richting} student who wants to specialize in"
                          "${members[i].specialisatie}  and  I started in ${members[0].cohort}")
                    ])))));
  }
}

class Member {
  String naam;
  String richting;
  String specialisatie;
  int cohort;

  Member(this.naam, this.richting, this.specialisatie, this.cohort);
}

class Event {
  DateTime time = DateTime.now();
  String title;
  String details;

  Event(this.title, this.details) {
    time = DateTime.now();
  }
}

String loremIpsumEnglish =
    "But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?";
var rng = Random();

Stream<Event> eventStreamer() async* {
  for (int i = 1; i <= 10; i++) {
    int start = rng.nextInt(loremIpsumEnglish.length - 150);
    var title = loremIpsumEnglish.substring(start, start + 30);
    var descr = loremIpsumEnglish.substring(start + 31, start + 150);
    yield Event(title, descr);
    await Future.delayed(Duration(seconds: 5));
  }
  return;
}

class Streams extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: AppDrawer(),
        appBar: AppBar(title: Text("streams")), // the title
        body: StreamBuilder<Event>(
            stream: eventStreamer(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text('Something went wrong');
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return LinearProgressIndicator();
              }
              var event = snapshot.data;
              return ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) => EventTile(event!));
            }));
  }
}

class EventTile extends StatelessWidget {
  EventTile(this.e);

  final Event e;

  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Card(
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          child: Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
            ListTile(
                title: Text('${e.title} on ${e.time}'),
                subtitle: Text((e.details.length < 150)
                    ? '${e.details}'
                    : e.details.substring(0, 149) + "...")),
          ]),
        ),
      ),
    );
  }
}

Future<Event> getEvent() async {
  await Future.delayed(Duration(milliseconds: 200));
  int start = rng.nextInt(loremIpsumEnglish.length - 150);
  var title = loremIpsumEnglish.substring(start, start + 30);
  var descr = loremIpsumEnglish.substring(start + 31, start + 150);
  return Event(title, descr);
}

class FutureScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Event>(
        future: getEvent(),
        builder: (context, snapshot) {
          if (snapshot.hasError) return Text('Error');
          if (snapshot.connectionState == ConnectionState.waiting)
            return LinearProgressIndicator();
          if (!snapshot.hasData || snapshot.data == null)
            return Text('Role snapshot has no data');
          final event = snapshot.data;
          return EventTile(event!);
        });
  }
}
