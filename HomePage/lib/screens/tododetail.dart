import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:myapp/models/todo.dart';

class TodoDetail extends StatefulWidget {
  final Todo todo;
  const TodoDetail({super.key,required this.todo});
  @override
  State<TodoDetail> createState() => _TodoDetailState();
}

class _TodoDetailState extends State<TodoDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('${widget.todo.title}detay'),
        actions: const [],
      ),
      body: Center(child: Text('${widget.todo.title}')),
    );
  }
}
