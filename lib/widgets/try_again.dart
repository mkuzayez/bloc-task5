import 'package:bloc_task5/bloc/to_do_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TryAgainWidget extends StatelessWidget {
  final String message;
  const TryAgainWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            child: Text(
              message,
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),
          ElevatedButton(
              onPressed: () {
                BlocProvider.of<ToDoBloc>(context).add(GetToDoItemsEvent());
              },
              child: const Text(
                "Try Again",
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
    );
  }
}
