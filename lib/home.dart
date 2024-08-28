import 'package:bloc_task5/API/to_do_api.dart';
import 'package:bloc_task5/bloc/to_do_bloc.dart';
import 'package:bloc_task5/widgets/loading.dart';
import 'package:bloc_task5/widgets/to_do.dart';
import 'package:bloc_task5/widgets/try_again.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ToDoBloc(toDoList: ToDoAPI())..add(GetToDoItemsEvent()),
      child: MaterialApp(
        theme: ThemeData.dark(),
        home: Scaffold(
          appBar: AppBar(),
          body: BlocBuilder<ToDoBloc, ToDoState>(
            builder: (context, state) {
              if (state is LoadedState) {
                return TodosWidget(
                  toDoItems: state.toDoItems,
                );
              } else if (state is FailedState) {
                print(state);

                return TryAgainWidget(
                  message: state.message,
                );
              } else {
                print(state);

                return const LoadingWidget();
              }
            },
          ),
        ),
      ),
    );
  }
}
