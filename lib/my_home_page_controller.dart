import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 動的に表示を変えたいState
class MyHomePageControllerState {
  MyHomePageControllerState({this.counter = 0, this.exception});
  final int counter;
  final Exception? exception;

  /// 値を変えるようのメソッド
  MyHomePageControllerState copyWith({required int counter, Exception? exception}) {
    return MyHomePageControllerState(counter: counter, exception: exception);
  }
}

/// コントローラ
class MyHomePageController extends StateNotifier<MyHomePageControllerState> {
  MyHomePageController(): super(MyHomePageControllerState()) {
    state = state.copyWith(counter: state.counter, exception: Exception('error'));
  }
  // riverpodで使うproviderはコントローラ用なのでstaticで定義
  static final provider = StateNotifierProvider((ref) => MyHomePageController());

  void incrementCounter() {
    state = state.copyWith(counter: state.counter + 1, exception: state.exception);
  }

  void dismissException() {
    state = state.copyWith(counter: state.counter, exception: null);
  }
}

