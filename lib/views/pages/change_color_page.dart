import 'package:flutter/material.dart';
import 'package:inherited_widget_example_app/views/widgets/color_item.dart';

class ChangeColorPage extends StatelessWidget {
  const ChangeColorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<MaterialColor> availableColors = [
      Colors.blue,
      Colors.red,
      Colors.green,
      Colors.amber,
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Color'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: availableColors
                .map(
                  (e) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ColorItem(
                      color: e,
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
