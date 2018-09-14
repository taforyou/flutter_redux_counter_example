import 'package:meta/meta.dart';

// เติมเข้าไปหน่อยเพราะทุกอย่างใน State มันไม่ควรจะแก้ไขตรงๆ ได้ หลักการ pure function แหละมั้ง เมื่อ class AppState เป็น Immutable แล้วต่อให้
// Instance ของ Class มันเกิดมาก็ต้องเป็น Immutable ด้วย ซึ่งแหล่มมากป้องกันการเขียนแบบกากๆ

@immutable
class AppState {
  
  final int count;

  AppState({
    this.count = 0,
  });

  factory AppState.initial() => new AppState(count: 69);

  factory AppState.test2(AppState _state) {
    int _test = _state.count;
    _test += 1;
    return new AppState(count: _test);
  }
}