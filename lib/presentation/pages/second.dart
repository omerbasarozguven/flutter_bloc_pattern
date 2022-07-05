import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_pattern/cubit/counter_cubit.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final mycontroller = TextEditingController();
  @override
  void initState() {
    super.initState();
    mycontroller.addListener(() {
      BlocProvider.of<CounterCubit>(context).takeString(mycontroller.text);
    });
  }

  @override
  void dispose() {
    mycontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
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
            TextField(
              controller: mycontroller,
            ),
            SizedBox(height: 24),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/third');
                },
                child: Text('go to third page'))
          ],
        ),
      ),
    );
  }
}
