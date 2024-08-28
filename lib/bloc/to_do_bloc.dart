import 'package:bloc/bloc.dart';
import 'package:bloc_task5/API/to_do_api.dart';
import 'package:bloc_task5/models/to_do.dart';
import 'package:equatable/equatable.dart';

part 'to_do_event.dart';
part 'to_do_state.dart';

class ToDoBloc extends Bloc<ToDoEvent, ToDoState> {
  final ToDoAPI toDoList;
  ToDoBloc({required this.toDoList}) : super(LoadingState()) {
    on<ToDoEvent>((event, emit) async {
      if (event is GetToDoItemsEvent) {
        emit(LoadingState());
        try {
          final toDoItems = await ToDoAPI().getToDoItems();
          emit(LoadedState(toDoItems: toDoItems));
        } catch (e) {
          emit(const FailedState(message: "Check your network connection"));
        }
      } else if (event is GetToDoItemsEvent) {}
    });
  }
}
