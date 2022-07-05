import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_pattern/cubit/counter_cubit.dart';
import 'package:flutter_bloc_pattern/cubit/textfield_cubit.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<TextFieldCubit, TextFieldState>(
      listener: (context, state) {
        //dispose();
        print(state);
        if (state.str == 'plus') {
          print('plus');
          BlocProvider.of<CounterCubit>(context).increment();
        } else if (state.str == 'minus') {
          print('minus');
          BlocProvider.of<CounterCubit>(context).decrement();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Second Page'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('You have pushed the button this many times:'),
              const SizedBox(height: 24),
              BlocBuilder<CounterCubit, CounterState>(
                  builder: (context, state) {
                return Text(state.counterValue.toString());
              }),
              const SizedBox(height: 24),
              TextField(
                onChanged: (text) {
                  BlocProvider.of<TextFieldCubit>(context).takeinput(text);
                },
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/');
                      },
                      child: const Text('Go to first page')),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/third');
                      },
                      child: const Text('Go to third page')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
