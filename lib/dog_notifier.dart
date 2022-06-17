import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_dog/dog_repository.dart';
import 'package:freezed_dog/dog_state.dart';

class NotifierDog extends StateNotifier<dogState> {
  NotifierDog({required IdogRepository repository})
      : repository_ = repository,
        super(const dogState.loading());

  final IdogRepository repository_;

  Future<void> GetData() async {
    state = const dogState.loading();
    try {
      final dog = await repository_.getDog();
      state = dogState.data(dog: dog);
    } catch (e) {
      state = dogState.error(
          "something goes wrong ============================================== $e");
    }
  }
}
