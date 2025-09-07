import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var counterValue = ref.watch(counterProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {
                    if (counterValue > 0) {
                      ref.read(counterProvider.notifier).state--;
                    }
                  },
                  icon: const Icon(
                    Icons.remove,
                    size: 50,
                  )),
              Text(
                counterValue.toString(),
                style: TextStyle(fontSize: 50, color: Colors.black),
              ),
              IconButton(
                  onPressed: () {
                    ref.read(counterProvider.notifier).state++;
                  },
                  icon: const Icon(
                    Icons.add,
                    size: 50,
                  )),
            ],
          )
        ],
      ),
    );
  }
}

final counterProvider = StateProvider<int>((ref) => 0);
