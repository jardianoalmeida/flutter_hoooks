import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

final _counter = Counter();

class HomePage extends HookWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = useListenable(_counter);
    final textController = useTextEditingController();

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Center(
            child: Text('${controller.value}'),
          ),
          TextField(
            controller: textController,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.increment();
        },
      ),
    );
  }
}

class Counter extends ChangeNotifier {
  int value = 0;
  increment() {
    value++;
    notifyListeners();
  }
}
