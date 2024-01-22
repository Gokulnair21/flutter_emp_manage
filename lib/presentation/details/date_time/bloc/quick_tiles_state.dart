import 'package:freezed_annotation/freezed_annotation.dart';

part 'quick_tiles_state.freezed.dart';

@freezed
abstract class QuickTilesState with _$QuickTilesState {
  factory QuickTilesState.initial() = Initial;

  factory QuickTilesState.onSelect(String value) = OnSelect;
}
