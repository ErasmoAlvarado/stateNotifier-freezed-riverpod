import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_dog/dog_provider.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    ref.read(dogNotifierProvider.notifier).GetData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(dogNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Freezed + StateNotifier + Riverpod'),
        centerTitle: true,
      ),
      body: state.when(
        initial: () => const Center(child: Text('press the buttom')),
        loading: () => const Center(child: CircularProgressIndicator()),
        data: (dog) => Center(child: Image.network(dog.message)),
        error: (error) => Text('something goes wrong $error'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(dogNotifierProvider.notifier).GetData();
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
