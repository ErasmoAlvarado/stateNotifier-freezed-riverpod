import 'package:freezed_dog/dog_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_dog/dog_repository.dart';
import 'package:freezed_dog/dog_state.dart';

final dogNotifierProvider = StateNotifierProvider<NotifierDog, dogState>((ref) {
  return NotifierDog(repository: ref.watch(DogRepositoryProvider));
});

final DogRepositoryProvider = Provider<IdogRepository>((ref) {
  return dogRepository();
});
