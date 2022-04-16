All widgets are either stateful or stateless. Stateful widgets are for when you want to see changes in the UI as the state changes. The members of widgets are supposed to be final or const, they are immutable. The data that does change for stateful widgets is maintained in a separate State object.

```

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  void _incrementCounter() {
    // some state modifying function
    setState(() {
      // if you change state and it needs  to be  reflected in the UI,
      //  it has to happen in the set state function
      _counter++;
    });
  }
  dumbincrCounter(){
  _counter++;}
  @override
  Widget build(BuildContext context) {
    return Text("zsdfg");
  }

}
```

When `setState` is called, the stateful widget gets rebuilt. Setstate accepts a function which changes the state as argument.

All widgets have a   `build(BuildContext)` method. The build method basically says what it should display, which child widgets, etc. When creating your own widgets, you usually override it. Here's an example of one. `BuildContext` provides build to access information from it's parents.

```
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'SomeDEmo'),
    );
  }
}
```

There's one more type of widget besides those 2 main ones: `InheritedWidget`. This is used for giving access to data that's further up the widget tree. Without it, if a widget 3 layers down needs access to the root widget, that info needs to be passed along each of those layers. By adding it, the property (in this case, title) can be accessed by any child further down the tree.

![[Pasted image 20220416133515.png]]

![[Pasted image 20220416133433.png]]

Now,  we'll go over some basic widgets:

# Opdracht

We gaan een app maken die je in staat stelt om comics te bekijken van https://xkcd.com/archive/

Features  (implementeer zoveel van ze als je kan):

1. Je kan scrollen door alle comics, alsof je door je facebook/instagram/twitter/reddit feed kan scrollen
2. Je kan dan op een comic clicken om het volledig te zien, in te zoomen, etc.
3. Je kan een comic saven.
4. Je kan een comic sharen.
5. Je kan drukken op een random button, die je een random comic laat zien.
6. Elke comic heeft een alt-tekst. De alt tekst moet visible zijn.
7. Een notificatie krijgen wanneer er een nieuwe comic beschikbaar is.
