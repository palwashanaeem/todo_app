
import 'package:flutter/material.dart';

class TodoTitle extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChanged;
  final Function()? onDelete;

  const TodoTitle({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          title: Text(
            taskName,
            style: TextStyle(
              decoration: taskCompleted ? TextDecoration.lineThrough : null,
            ),
          ),
          leading: Checkbox(
            value: taskCompleted,
            onChanged: onChanged,
          ),
          trailing: IconButton(
            icon: const Icon(Icons.delete),
            onPressed: onDelete,
          ),
        ),
      ),
    );
  }
}