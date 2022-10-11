import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/blocs/blocs.dart';

class TodoHeader extends StatelessWidget {
  const TodoHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Todo app',
          style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
        ),
        BlocListener<TodoListBloc, TodoListState>(
          listener: (context, state) {
            context.read<ActiveTodoCountBloc>().add(ChangeActiveTodoCountEvent(
                newActiveTodoCount: state.todoList
                    .where((element) => !element.isCompleted)
                    .toList()
                    .length));
          },
          child: Text(
            '${context.watch<ActiveTodoCountBloc>().state.activeTodoCount} items left',
            style: const TextStyle(fontSize: 20.0, color: Colors.red),
          ),
        )
      ],
    );
  }
}
