import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_bloc/bloc/bloc/colorbloc_bloc.dart';
import 'package:multi_bloc/bloc/bloc/counter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CounterBloc>(
          create: (context) => CounterBloc(),
        ),
        BlocProvider<ColorblocBloc>(
          create: (context) => ColorblocBloc(),
        ),
      ],
      child: const MaterialApp(
        title: 'Flutter Demo',
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<ColorblocBloc, ColorState>(
                buildWhen: (previous, current) {
              print(previous.color);
              print(current.color);
              return true;
            }, builder: (context, state) {
              return Container(
                color: state.color,
                width: 45,
                height: 45,
              );
            }),
            const SizedBox(
              height: 30,
            ),
            BlocBuilder<CounterBloc, CounterState>(
                buildWhen: (previous, current) {
              print(previous.counter);
              print(current.counter);
              return true;
            }, builder: (context, state) {
              return Text(
                state.counter.toString(),
                style: Theme.of(context).textTheme.headlineMedium,
              );
            }),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(CounterIncrementEvent());
                    context.read<ColorblocBloc>().add(CounterIncrementEvent());
                  },
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                ),
                FloatingActionButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(CounterDecrementEvent());
                    context.read<ColorblocBloc>().add(CounterDecrementEvent());
                  },
                  tooltip: 'decrement',
                  child: const Icon(Icons.remove),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
