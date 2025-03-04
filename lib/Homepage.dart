
import 'package:flutter/material.dart';
import 'package:flutter_todoapp/todo_title.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // List to store todos
  final List<Map<String, dynamic>> _todos = [
    {'task': 'Make Tutorial', 'completed': false},
    {'task': 'Learn Flutter', 'completed': true},
  ];

  // Controller for text field
  final TextEditingController _textController = TextEditingController();

  void _addTodo() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add New Task'),
        content: TextField(
          controller: _textController,
          decoration: const InputDecoration(hintText: 'Enter task name'),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _textController.clear();
            },
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (_textController.text.isNotEmpty) {
                setState(() {
                  _todos.add({
                    'task': _textController.text,
                    'completed': false
                  });
                });
                Navigator.pop(context);
                _textController.clear();
              }
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  void _deleteTodo(int index) {
    setState(() {
      _todos.removeAt(index);
    });
  }

  void _toggleTodo(int index) {
    setState(() {
      _todos[index]['completed'] = !_todos[index]['completed'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellowAccent[200],
      appBar: AppBar(
        title: const Text('TO DO'),
        shadowColor: Colors.amber,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTodo,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: _todos.length,
        itemBuilder: (context, index) => TodoTitle(
          taskName: _todos[index]['task'],
          taskCompleted: _todos[index]['completed'],
          onChanged: (value) => _toggleTodo(index),
          onDelete: () => _deleteTodo(index),
        ),
      ),
    );
  }
}