import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../viewmodels/counter_viewmodel.dart';

class CounterWidget extends ConsumerWidget {
  const CounterWidget({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counterState = ref.watch(counterViewModelProvider);
    final counterStateRead = ref.read(counterViewModelProvider.notifier);
    return ListTile(
      title: Text(counterState.count.toString()),
      trailing: ElevatedButton(onPressed: (){
        counterStateRead.increment();
      }, child: Text('증가')),
    );
  }
}
