

import 'package:flutter/material.dart';
import 'package:form/users.dart';

import 'form.dart';

class MultiForm extends StatefulWidget {
  const MultiForm({Key? key}) : super(key: key);

  @override
  _MultiFormState createState() => _MultiFormState();
}

class _MultiFormState extends State<MultiForm> {
  List<User> users = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Users Form"),
      ),
      body: Column(children: [
        Container(
          height: 550,
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: users.length,
              itemBuilder: (BuildContext, index) {
                return UserForm(user: users[index], onDelete: () {
                  users.removeAt(users.indexOf(users[index]));
                  setState(() {
                  });
                },);
              }),
        ),
        Expanded(
          child: TextButton(
              onPressed: () {
                printUsers();
              },
              child: Text("Submit")),
        ),
      ]),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            users.add(User());
          });
        },
      ),
    );
  }

  printUsers(){
    for(int i=0;i<= users.length;i++){
      print(users[i].username);
    }
  }
}
