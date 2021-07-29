import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 動的に表示を変えたいState
class MyHomePageControllerState {
  MyHomePageControllerState({this.counter = 0});
  final int counter;

  /// 値を変えるようのメソッド
  MyHomePageControllerState copyWith({required int counter}) {
    return MyHomePageControllerState(counter: counter);
  }
}

/// コントローラ
class MyHomePageController extends StateNotifier<MyHomePageControllerState> {
  MyHomePageController(): super(MyHomePageControllerState()) {
    state = state.copyWith(counter: 10); // 初期化処理！
  }
  // riverpodで使うproviderはコントローラ用なのでstaticで定義
  static final provider = StateNotifierProvider.autoDispose((ref) => MyHomePageController());

  void incrementCounter() {
    state = state.copyWith(counter: state.counter + 1);
  }
}

