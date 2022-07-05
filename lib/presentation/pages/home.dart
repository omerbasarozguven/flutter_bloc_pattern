import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_pattern/cubit/counter_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('You have pushed the button this many times:'),
            SizedBox(height: 24),
            BlocConsumer<CounterCubit, CounterState>(
              builder: (context, state) {
                return Text(state.counterValue.toString());
              },
              listener: (context, state) {
                if (state.wasIncremented! == true) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Incremented!'),
                      duration: Duration(milliseconds: 200),
                    ),
                  );
                } else if (state.wasIncremented! == false) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Decremented!'),
                      duration: Duration(milliseconds: 200),
                    ),
                  );
                }
              },
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).decrement();
                    },
                    child: Text('-')),
                ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).increment();
                    },
                    child: Text('+')),
              ],
            ),
            SizedBox(height: 24),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/second');
                },
                child: Text('Go to second page')),
          ],
        ),
      ),
    );
  }
}
