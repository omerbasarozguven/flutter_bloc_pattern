import 'package:flutter/material.dart';
import 'package:flutter_bloc_pattern/cubit/counter_cubit.dart';
import 'package:flutter_bloc_pattern/presentation/pages/home.dart';
import 'package:flutter_bloc_pattern/presentation/pages/second.dart';
import 'package:flutter_bloc_pattern/presentation/pages/third.dart';

class AppRouter {
  final CounterCubit _counterCubit = CounterCubit();
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/second':
        return MaterialPageRoute(builder: (_) => SecondPage());
      case '/third':
        return MaterialPageRoute(builder: (_) => ThirdPage());
      default:
        return MaterialPageRoute(builder: (_) => HomePage());
    }
  }
}
