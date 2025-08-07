import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CounterModel(),
      child: MyApp(),
    ),
  );
}

class CounterModel extends ChangeNotifier {
  int count = 0;

  void increment() {
    count++;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Workout Tracker',
      debugShowCheckedModeBanner: false,
      home: WorkoutHome(),
    );
  }
}

class WorkoutHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<CounterModel>(context);
    bool isEven = counter.count % 2 == 0;

    return Scaffold(
      appBar: AppBar(
        title: Text('Workout Tracker'),
        backgroundColor: isEven ? Colors.blue : Colors.green,
      ),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(milliseconds: 500),
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            color: isEven ? Colors.blue : Colors.green,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(
              '${counter.count}',
              style: TextStyle(fontSize: 40, color: Colors.white),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: counter.increment,
        child: Icon(Icons.fitness_center),
      ),
    );
  }
}
