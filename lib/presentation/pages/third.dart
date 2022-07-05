import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_pattern/cubit/counter_cubit.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Third Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('You have pushed the button this many times:'),
            SizedBox(height: 24),
            BlocBuilder<CounterCubit, CounterState>(builder: (context, state) {
              return Text(state.counterValue.toString());
            }),
            SizedBox(height: 24),
            Text('The text you wrote was'),
            SizedBox(height: 24),
            BlocBuilder<CounterCubit, CounterState>(builder: (context, state) {
              return Text(state.str!);
            }),
            SizedBox(height: 24),
            ElevatedButton(
                onPressed: () {
                  BlocProvider.of<CounterCubit>(context).takeString('');
                  Navigator.of(context).pushNamed('/second');
                },
                child: Text('Go to second page')),
          ],
        ),
      ),
    );
  }
}
