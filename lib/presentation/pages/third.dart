import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_pattern/cubit/counter_cubit.dart';
import 'package:flutter_bloc_pattern/cubit/textfield_cubit.dart';

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
        title: const Text('Third Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            const SizedBox(height: 24),
            BlocBuilder<CounterCubit, CounterState>(builder: (context, state) {
              return Text(state.counterValue.toString());
            }),
            const SizedBox(height: 24),
            BlocBuilder<TextFieldCubit, TextFieldState>(
                builder: (context, state) {
              return Text('The text you wrote was ' + state.str);
            }),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/second');
                    },
                    child: const Text('Go to second page')),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/');
                    },
                    child: const Text('Go to first page')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
