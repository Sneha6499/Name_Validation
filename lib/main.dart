import 'package:flutter/material.dart';

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
  //bool ?isChecked = false;

  final _controllerffname = TextEditingController();
  final String fname = "";
  int count = 0;
  bool valid = false;

  // if (selectedIndexes.contains(index)) {
  // selectedIndexes.remove(index);   // unselect
  // } else {
  // selectedIndexes.add(index);  // select
  // }

  late final List<User> list = [];

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/a.jpeg"), fit: BoxFit.cover),
        ),
        // padding: const EdgeInsets.only(right: 300,left: 10),
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 10),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  const Text(
                    'LIST ',
                    style: TextStyle(fontSize: 22, color: Colors.black),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 250),
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'All Select',
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    //padding: const EdgeInsets.all(10),
                    child: TextField(
                      textCapitalization: TextCapitalization.words,
                      controller: _controllerffname,
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: 'Enter Your Name',
                          errorText: valid ? 'Fill proper name' : null),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    //   height: 50,
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: ElevatedButton(
                        child: const Text('Add'),
                        onPressed: () {
                          setState(() {

                            if( _controllerffname.text.startsWith(RegExp(r'[A-Z]'))  &&
                                !_controllerffname.text.endsWith(" ") &&
                                _controllerffname.text.length > 2 &&_controllerffname.text.contains
                              (RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$")))
                            {

                              valid = false;

                              list.add(User(_controllerffname.text, false));
                              _controllerffname.clear();
                            }

                            // if(_controllerffname.text!=" "){
                            //   count++;
                            // }

                            else {
                              valid = true;
                            }
                          });
                        },
                      )),
                ],
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.red,
                          child: Center(
                            child: Text(

                              getText(list[index].title),
                              //     list[index].title[0],

                              style: const TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        //textColor: (index % 2 == 0) ? Colors.red : Colors.blue,
                        title: Text(list[index].title),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Checkbox(
                              checkColor: Colors.white,
                              //fillColor: MaterialStateProperty.resolveWith(getColor),
                              value: list[index].isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  list[index].isChecked = value!;
                                });
                              },
                            ),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    list.removeAt(index);
                                  });
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  size: 30.0,
                                )),
                          ],
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String getText(String string) {

    final array = string.split(" ");

    return array[0][0] + array[array.length - 1][0];;
  }
}

class User {
  var title = "";
  var isChecked = false;

  User(this.title, this.isChecked);
}

//"\p{Upper}(\p{Lower}+\s?)"
