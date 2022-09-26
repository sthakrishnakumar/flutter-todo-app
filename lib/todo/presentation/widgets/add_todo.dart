import 'package:flutter/material.dart';
import 'package:flutter_todo_app/commons/commons.dart';
import 'package:flutter_todo_app/home.dart';
import 'package:flutter_todo_app/todo/data/model/todo_model.dart';

class AddToDoPage extends StatefulWidget {
  const AddToDoPage({Key? key}) : super(key: key);

  @override
  State<AddToDoPage> createState() => _AddToDoPageState();
}

class _AddToDoPageState extends State<AddToDoPage> {
  late TextEditingController todoController;
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  void initState() {
    todoController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    todoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add To Do'),
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: [
              TextFormField(
                controller: todoController,
                validator: (value) {
                  return todoController.text.isEmpty
                      ? "Todo can't be empty"
                      : null;
                },
                decoration: const InputDecoration(
                  hintText: 'Todo title',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    setState(() {
                      ToDoModel.todoList.add(
                        ToDoModel(title: todoController.text),
                      );
                    });
                    navigation(context, const Home());
                  }
                },
                child: const Text('Add Todo'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
