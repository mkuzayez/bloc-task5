part of 'to_do_bloc.dart';

sealed class ToDoState extends Equatable {
  const ToDoState();

  @override
  List<Object> get props => [];
}

class LoadingState extends ToDoState {}

class LoadedState extends ToDoState {
  final List<ToDoItem> toDoItems;

  const LoadedState({required this.toDoItems});

  @override
  List<Object> get props => [toDoItems];
}

class FailedState extends ToDoState {
  final String message;

  const FailedState({required this.message});

  @override
  List<Object> get props => [message];
}
