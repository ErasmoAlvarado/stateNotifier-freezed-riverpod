import 'package:freezed_dog/dog_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'dog_state.freezed.dart';

extension dogGetters on dogState {
  bool get isLoading => this is _dogStateLoading;
}

@freezed
abstract class dogState with _$dogState {
  const factory dogState.initial() = _dogStateInitial;

  const factory dogState.loading() = _dogStateLoading;

  const factory dogState.data({required DogModel dog}) = _dogStateData;

  const factory dogState.error([String? error]) = _dogStateError;
}
