import 'package:flutter/material.dart';
import 'package:inherited_widget_example_app/controllers/state_widget.dart';
import 'package:inherited_widget_example_app/views/pages/change_color_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = StateInheritedWidget.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(48.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                state.state.counter.toString(),
                style: Theme.of(context).textTheme.headline3,
              ),
              const SizedBox(height: 32.0),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const ChangeColorPage(),
                    ),
                  ),
                  icon: const Icon(Icons.color_lens),
                  label: const Text('Change Primary Swatch'),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: state.incrementCounter,
        child: const Icon(Icons.add),
      ),
    );
  }
}
