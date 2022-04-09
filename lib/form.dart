

import 'package:flutter/material.dart';
import 'package:form/users.dart';

typedef OnDelete();

class UserForm extends StatefulWidget {
  final User user;
  final state = _UserFormState();
  final OnDelete onDelete;
  // final onDelete onDelete;

  UserForm({Key? key, required this.user, required this.onDelete, }) : super(key: key);
  @override
  _UserFormState createState() => state;
}

class _UserFormState extends State<UserForm> {
  final form = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Card(
        child: Form(
          key: form,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppBar(
                leading: Icon(Icons.person),
                title: Text("User Form"),
                actions: [
                  IconButton(onPressed: (){
                    widget.onDelete();
                  }, icon:Icon(Icons.delete)),
                ],
              ),
              TextFormField(
                initialValue: widget.user.username,
                onChanged: (value){
                  widget.user.username=value;
                },
              ),
              TextFormField(
                initialValue: widget.user.email,
                onChanged: (value){
                  widget.user.email=value;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
