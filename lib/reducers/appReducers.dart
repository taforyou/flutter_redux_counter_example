import 'package:redux/redux.dart';
import 'package:flutter_redux_counter_example/appState.dart';
import 'package:flutter_redux_counter_example/actions/appAction.dart';

final appReducer = combineReducers<AppState>([
  TypedReducer<AppState, IncrementalAction>(_onLoad3),
]);

AppState _onLoad(AppState state, IncrementalAction action) => 
    AppState.test2(state);

AppState _onLoad1(AppState state, IncrementalAction action) {
  print(state);
  print(action);
  return AppState.test2(state);
}
                  // previous state?? // action ???
AppState _onLoad3(AppState state, IncrementalAction action) {
  // ทำไม่ได้เพราะเราค่า count ไม่สามารถเปลี่ยนแปลงได้ Immutable
  // เอามาเพืื่อรับ old state แล้ว ส่ง state ใหม่กลับไป
  // ลอง state.count++; น่าจะพังเลย !!! เพราะ immutable
  int _tempState = state.count;
  _tempState++;
  return AppState(count: state.count + 1);
  // อย่างเนี้ย mutate state นะ ???
  // ควรเขียน If ตรงนี้แหละ ว่าถ้า type of action มันกลับมาเป็นอะไรให้ทำแบบนั้น
}

// AppState

// @immutable
// class AppState {
//   final bool isLoading;
//   final List<Todo> todos;
//   final AppTab activeTab;
//   final VisibilityFilter activeFilter;

//   AppState(
//       {this.isLoading = false,
//       this.todos = const [],
//       this.activeTab = AppTab.todos,
//       this.activeFilter = VisibilityFilter.all});

//   factory AppState.loading() => AppState(isLoading: true);
// }

// ดู ClassAddTodo
// class AddTodoAction {
//   final Todo todo;

//   AddTodoAction(this.todo);

//   @override
//   String toString() {
//     return 'AddTodoAction{todo: $todo}';
//   }
// }

// List<Todo> _addTodo(List<Todo> todos, AddTodoAction action) {
// ถ้า Print แค่ action เฉยๆ จะได้ string กลับมา ให้ดู ClassAddTodoAction
//   print(action); // Return มาเป็น 'AddTodoAction{todo: $todo}';
//   print(todos); // ก็คือ ค่า State ใน Store (ดู State จาก Class appState)
//   print(action.todo); //ก็คือ List ที่เราเพิ่มเข้าไปใหม่เท่านั้นเอง
//   return List.from(todos)..add(action.todo); //methode นี้ก็คือ return state todo ที่ต่อกันแล้วกลับคืนไปเฉยๆ แต่จริงๆ State todo มันควรจะยังไม่เปลี่ยนมั้ย เพราะมัน Immutable ?? เอ๋แล้วมันเปลี่ยนได้ไงหว่า ???
// }
  
//หน้าตามันออกมาประมาณนี้ตอน Print

// มันแปลได้ว่าคือ เอา action.todo ที่ทำมาไปยัดเข้าใน todos เลย
// I/flutter ( 4289): [Todo{complete: false, task: Buy food for da kitty, note: With the chickeny bits!, id: 1}, Todo{complete: false,task: Find a Red Sea dive trip, note: Echo vs MY Dream, id: 2}, Todo{complete: true, task: Book flights to Egypt, note: , id: 3}, Todo{complete: true, task: Decide on accommodation, note: , id: 4}, Todo{complete: true, task: Sip Margaritas, note: on the beach, id: 5}]
// I/flutter ( 4289): Todo{complete: false, task: def, note: , id: 6916acd2-a0dc-4240-8f34-cc214c3161e8}

