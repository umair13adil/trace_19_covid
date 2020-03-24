import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MultiSelectChip extends StatefulWidget {
  final List<String> itemsList;

  MultiSelectChip(this.itemsList);

  @override
  _MultiSelectChipState createState() => _MultiSelectChipState();
}

class _MultiSelectChipState extends State<MultiSelectChip> {
  List<String> selectedChoice = List<String>();

  _buildChoiceList() {
    List<Widget> choices = List();

    widget.itemsList.forEach((item) {
      choices.add(Container(
        padding: const EdgeInsets.all(2.0),
        child: ChoiceChip(
          label: Text(item),
          selected: selectedChoice.contains(item),
          onSelected: (selected) {
            setState(() {
              if (selectedChoice.contains(item)) {
                selectedChoice.remove(item);
              } else {
                selectedChoice.add(item);
              }
            });
          },
        ),
      ));
    });

    return choices;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: _buildChoiceList(),
    );
  }
}
