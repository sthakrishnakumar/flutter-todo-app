import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
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
            child: Slidable(
              key: const ValueKey(0),
              endActionPane: ActionPane(
                // dismissible: DismissiblePane(
                //   onDismissed: () {
                //     setState(() {
                //       todoList.removeAt(index);
                //     });
                //   },

                // ),
                motion: const StretchMotion(),
                children: [
                  SlidableAction(
                    onPressed: (value) {
                      setState(() {
                        todoList.removeAt(index);
                      });
                    },
                    backgroundColor: const Color(0xFFFE4A49),
                    foregroundColor: Colors.white,
                    icon: Icons.delete,
                    label: 'Delete',
                  ),
                ],
              ),
              child: ListTile(
                textColor: todoList[index].isTaskCompleted
                    ? Colors.blue
                    : Colors.black,
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
                trailing: todoList[index].isTaskCompleted
                    ? InkWell(
                        onTap: () {
                          setState(() {
                            todoList.removeAt(index);
                          });
                        },
                        child: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      )
                    : const Text(''),
              ),
            ),
          );
        },
      ),
    );
  }
}
