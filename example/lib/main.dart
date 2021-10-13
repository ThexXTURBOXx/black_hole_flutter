import 'package:black_hole_flutter/black_hole_flutter.dart';
import 'package:flutter/material.dart';

import 'buttons.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '🛠 black_hole_flutter example',
      home: Scaffold(
        appBar: AppBar(title: Text('🛠 black_hole_flutter example')),
        body: ListView(children: <Widget>[
          BottomSheetExample(),
          ButtonsExample(),
          ChipGroupExample(),
          SeparatedButtonsExample(),
          FillOrWrapExample(),
        ]),
      ),
    );
  }
}

class BottomSheetExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Section(
      title: 'FancyBottomSheet',
      children: [
        FancyElevatedButton(
          onPressed: () {
            context.showFancyModalBottomSheet<void>(
              builder: (_) => Padding(
                padding: EdgeInsets.symmetric(vertical: 128, horizontal: 16),
                child: Text("I'm fancy!"),
              ),
            );
          },
          child: Text('Open FancyBottomSheet'),
        ),
      ],
    );
  }
}

class ChipGroupExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Section(
      title: 'ChipGroup',
      children: [
        ChipGroup(children: [
          Chip(label: Text('Lorem')),
          Chip(label: Text('ipsum')),
          Chip(label: Text('dolor')),
          Chip(label: Text('sit')),
          Chip(label: Text('amet')),
          Chip(label: Text('consectetur')),
          Chip(label: Text('adipiscing')),
          Chip(label: Text('elit')),
          Chip(label: Text('sed')),
          Chip(label: Text('do')),
          Chip(label: Text('eiusmod')),
          Chip(label: Text('tempor')),
          Chip(label: Text('incididunt')),
        ]),
      ],
    );
  }
}

class SeparatedButtonsExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Section(
      title: 'SeparatedButtons',
      children: [
        SeparatedButtons(children: [
          TextButton(onPressed: () {}, child: Text('Imprint')),
          TextButton(onPressed: () {}, child: Text('Privacy Policy')),
          TextButton(onPressed: () {}, child: Text('Licenses')),
        ]),
      ],
    );
  }
}

class FillOrWrapExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Section(
      title: 'FillOrWrap',
      children: [
        Text('Enough horizontal space → no wrapping'),
        _buildExample(isConstrained: false),
        SizedBox(height: 16),
        Text('Constrained horizontal space → wrapping'),
        _buildExample(isConstrained: true),
      ],
    );
  }

  Widget _buildExample({required bool isConstrained}) {
    return Center(
      child: Container(
        constraints: isConstrained ? BoxConstraints(maxWidth: 200) : null,
        decoration: BoxDecoration(border: Border.all()),
        child: FillOrWrap(
          spacing: 8,
          wrappedSpacing: 8,
          children: [
            TextButton(onPressed: () {}, child: Text('Short')),
            TextButton(onPressed: () {}, child: Text('Loooooooooong')),
            TextButton(onPressed: () {}, child: Text('Short')),
          ],
        ),
      ),
    );
  }
}

class Section extends StatelessWidget {
  const Section({Key? key, required this.title, required this.children})
      : super(key: key);

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: context.textTheme.subtitle1),
          SizedBox(height: 8),
          ...children
        ],
      ),
    );
  }
}
