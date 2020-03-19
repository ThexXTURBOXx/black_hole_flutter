import 'package:black_hole_flutter/black_hole_flutter.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class ButtonsExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Section(
      title: 'Buttons',
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Table(
            defaultColumnWidth: IntrinsicColumnWidth(),
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: [
              _buildRow('Widget', [
                Text('default'),
                Text('onPressed: null'),
                Text('isEnabled: false'),
                Text('isLoading: true,\nloadingChild: null'),
                Text('isLoading: true'),
              ]),
              _buildSpacerRow(),
              _buildFancyFlatButtonRow(),
              _buildSpacerRow(),
              _buildFancyRaisedButtonRow(),
              _buildSpacerRow(),
              _buildFancyFabRow(),
              _buildSpacerRow(),
              _buildExtendedFancyFabRow(),
            ],
          ),
        )
      ],
    );
  }

  TableRow _buildFancyFlatButtonRow() => _buildRow('FancyFlatButton', [
        FancyFlatButton(
          onPressed: () {},
          child: Text('child'),
        ),
        FancyFlatButton(
          onPressed: null,
          child: Text('child'),
        ),
        FancyFlatButton(
          isEnabled: false,
          onPressed: () {},
          child: Text('child'),
        ),
        FancyFlatButton(
          onPressed: () {},
          isLoading: true,
          child: Text('child'),
        ),
        FancyFlatButton(
          onPressed: () {},
          isLoading: true,
          loadingChild: Text('loadingChild'),
          child: Text('child'),
        ),
      ]);

  TableRow _buildFancyRaisedButtonRow() => _buildRow('FancyRaisedButton', [
        FancyRaisedButton(
          onPressed: () {},
          child: Text('child'),
        ),
        FancyRaisedButton(
          onPressed: null,
          child: Text('child'),
        ),
        FancyRaisedButton(
          isEnabled: false,
          onPressed: () {},
          child: Text('child'),
        ),
        FancyRaisedButton(
          onPressed: () {},
          isLoading: true,
          child: Text('child'),
        ),
        FancyRaisedButton(
          onPressed: () {},
          isLoading: true,
          loadingChild: Text('loadingChild'),
          child: Text('child'),
        ),
      ]);

  TableRow _buildFancyFabRow() => _buildRow('FancyFab', [
        FancyFab(
          onPressed: () {},
          icon: Icon(Icons.favorite),
        ),
        FancyFab(
          onPressed: null,
          icon: Icon(Icons.favorite),
        ),
        FancyFab(
          isEnabled: false,
          onPressed: () {},
          icon: Icon(Icons.favorite),
        ),
        FancyFab(
          onPressed: () {},
          isLoading: true,
          icon: Icon(Icons.favorite),
        ),
        FancyFab(
          onPressed: () {},
          isLoading: true,
          loadingLabel: Text('loadingLabel'),
          icon: Icon(Icons.favorite),
        ),
      ]);
  TableRow _buildExtendedFancyFabRow() => _buildRow('FancyFab.extended', [
        FancyFab.extended(
          onPressed: () {},
          label: Text('label'),
          icon: Icon(Icons.favorite),
        ),
        FancyFab.extended(
          onPressed: null,
          label: Text('label'),
          icon: Icon(Icons.favorite),
        ),
        FancyFab.extended(
          isEnabled: false,
          onPressed: () {},
          label: Text('label'),
          icon: Icon(Icons.favorite),
        ),
        FancyFab.extended(
          onPressed: () {},
          isLoading: true,
          label: Text('label'),
          icon: Icon(Icons.favorite),
        ),
        FancyFab.extended(
          onPressed: () {},
          isLoading: true,
          loadingLabel: Text('loadingLabel'),
          label: Text('label'),
          icon: Icon(Icons.favorite),
        ),
      ]);

  TableRow _buildRow(String title, List<Widget> children) {
    return TableRow(children: [
      // SizedBox(width: 8),
      Text(title),
      for (final child in children) ...[
        SizedBox(width: 8),
        Center(child: child),
      ],
      // SizedBox(width: 8),
    ]);
  }

  TableRow _buildSpacerRow() =>
      TableRow(children: List.filled(11, SizedBox(height: 8)));
}

extension WidgetListPadding on List<Widget> {
  List<Widget> get padded {
    return expand((w) sync* {
      yield SizedBox(width: 8);
      yield Center(child: w);
    }).toList();
  }
}
