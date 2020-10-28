import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:simple_weight_management/components/weight_register_pop_up.dart';
part 'my_page_notifier.freezed.dart';

@freezed
abstract class MyPageState with _$MyPageState {
  const factory MyPageState({
    @Default(0) int count,
    String weight,
    String comment,
    @Default([]) List<Map<String, String>> record,
  }) = _MyPageState;
}

class MyPageNotifier extends StateNotifier<MyPageState> with LocatorMixin {
  MyPageNotifier({
    @required this.context,
  }) : super(const MyPageState());

  final BuildContext context;

  @override
  void dispose() {
    print('dispose');
    super.dispose();
  }

  @override
  void initState() {}

  void pushButton() {
    print('notifier!');
    state = state.copyWith(count: state.count + 1);
    print(state.count);
  }

  void popUpForm() {
    showDialog(
      context: context,
      builder: (context) {
        return WeightRegisterPopUp(_saveWeight, _saveComment, _register);
      },
    );
  }

  void _saveWeight(String value) {
    state = state.copyWith(weight: value);
    print(state.weight);
  }

  void _saveComment(String value) {
    state = state.copyWith(comment: value);
    print(state.comment);
  }

  void _register() {
    final formRecord = {
      'weight': state.weight,
      'comment': state.comment,
      'day': DateTime.now().toString(),
    };
    print(formRecord);
    final newRecord = List<Map<String, String>>.from(state.record);
    newRecord.add(formRecord);
    state = state.copyWith(record: newRecord);
    print(state.record);
    Navigator.pop(context);
  }
}
