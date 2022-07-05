import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_pattern/cubit/counter_cubit.dart';
import 'package:flutter_bloc_pattern/cubit/textfield_cubit.dart';
import 'package:flutter_bloc_pattern/presentation/pages/home.dart';
import 'package:flutter_bloc_pattern/presentation/pages/second.dart';
import 'package:flutter_bloc_pattern/presentation/pages/third.dart';

class AppRouter {
  final CounterCubit _counterCubit = CounterCubit();
  final TextFieldCubit _textFieldCubit = TextFieldCubit();

  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _counterCubit,
            child: const HomePage(),
          ),
        );
      case '/second':
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider.value(value: _counterCubit),
              BlocProvider.value(value: _textFieldCubit),
            ],
            child: const SecondPage(),
          ),
        );
      case '/third':
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider.value(value: _counterCubit),
              BlocProvider.value(value: _textFieldCubit),
            ],
            child: const ThirdPage(),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _counterCubit,
            child: const HomePage(),
          ),
        );
    }
  }

  void dispose() {
    _counterCubit.close();
    _textFieldCubit.close();
  }
}
