import 'package:flutter/material.dart';
import 'package:flutter_todo_app/commons/commons.dart';
import 'package:flutter_todo_app/todo/data/model/todo_model.dart';
import 'package:flutter_todo_app/todo/presentation/widgets/add_todo.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    List todoList = ToDoModel.todoList;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigation(context, const AddToDoPage());
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: ListTile(
              tileColor: Colors.grey[300],
              title: Text(todoList[index].title),
              leading: Checkbox(
                activeColor: Colors.green,
                value: todoList[index].isTaskCompleted,
                onChanged: (value) {
                  setState(() {
                    todoList[index].isTaskCompleted = value;
                  });
                },
              ),
              trailing: InkWell(
                onTap: () {
                  setState(() {
                    todoList.removeAt(index);
                  });
                },
                child: const Icon(Icons.delete),
              ),
            ),
          );
        },
      ),
    );
  }
}
