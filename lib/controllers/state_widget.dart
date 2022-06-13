import 'package:flutter/material.dart';
import 'package:inherited_widget_example_app/models/app_state.dart';

class StateWidget extends StatefulWidget {
  final Widget child;

  const StateWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  State<StateWidget> createState() => _StateWidgetState();
}

class _StateWidgetState extends State<StateWidget> {
  var state = AppState();

  void incrementCounter() {
    final counter = state.counter + 1;
    final newState = state.copyWith(counter: counter);

    setState(() => state = newState);
  }

  void changeColor(MaterialColor newPrimarySwatch) {
    final newState = state.copyWith(primarySwatch: newPrimarySwatch);

    setState(() => state = newState);
  }

  @override
  Widget build(BuildContext context) => StateInheritedWidget(
        state: state,
        stateWidget: this,
        child: widget.child,
      );
}

class StateInheritedWidget extends InheritedWidget {
  final AppState state;
  final _StateWidgetState stateWidget;

  const StateInheritedWidget({
    Key? key,
    required super.child,
    required this.state,
    required this.stateWidget,
  }) : super(
          key: key,
        );

  static _StateWidgetState of(BuildContext context) => context
      .dependOnInheritedWidgetOfExactType<StateInheritedWidget>()!
      .stateWidget;

  @override
  bool updateShouldNotify(covariant StateInheritedWidget oldWidget) =>
      oldWidget.state != state;
}
