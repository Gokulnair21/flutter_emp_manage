import 'package:freezed_annotation/freezed_annotation.dart';

part 'details_state.freezed.dart';

@freezed
abstract class DetailsState with _$DetailsState {

  factory DetailsState.initialize()=Initialize;
  factory DetailsState.onDataSaved() = DataSaved;

  factory DetailsState.onDataUpdated() = DataUpdated;

  factory DetailsState.onValidationFailed(DateTime d, String message) =
      ValidationFailed;
}
