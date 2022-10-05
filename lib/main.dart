import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData (
    brightness: Brightness.light,
    primaryColor: Colors.cyan,
      accentColor: Colors.blue),
  home: MyApp(),
));
//class MyApp extends StatefulWidget
class MyApp extends StatefulWidget {
 // const ({Key? key}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //List<int> foo = [];
  List todos = [];
  String input = "";


// };

  @override
  void initState() {
    super.initState();
    todos.add("Task1");
    todos.add("Task2");
    todos.add("Task3");
    todos.add("Task4");

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My todo list"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:() {
          showDialog(

              context: context,

              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Add todolist"),
                  content: TextField(
                    onChanged: (String value) {
                      input = value;
                    },
                  ),
                  actions: <Widget>[
                    FloatingActionButton(
                        onPressed: () {
                          setState(() {
                            todos.add(input);
                          });
                          Navigator.of(context).pop();
                        },
                        child: Text("Add"))
                  ],
                );
              });
        },

    child: Icon(
   Icons.add,
    color: Colors.deepPurpleAccent,
    ),
      ),
      body: ListView.builder(itemCount:todos.length,
          itemBuilder: (BuildContext conntext, int index) {
        return Dismissible(
        key: Key(todos[index]),
     //elevation: 4,
     child: Card(
      margin: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius:
      BorderRadius.circular(8)),
    child: ListTile(
    title: Text(todos[index]),
      trailing: IconButton(icon: Icon(Icons.delete, color: Colors.red,)
        , onPressed: (){
        setState(() {
         todos.removeAt(index) ;
        });
          }),
    ),
    ));
    }),
    );
  }
  }
