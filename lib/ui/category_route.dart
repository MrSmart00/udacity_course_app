import 'package:udacity_course_app/models/category.dart';
import 'package:udacity_course_app/models/unit.dart';
import 'package:flutter/material.dart';

import 'category_cell.dart';

class CategoryRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CategoryRouteState();
}

class _CategoryRouteState extends State<CategoryRoute> {
  static const _categoryNames = <String>[
    'Length',
    'Area',
    'Volume',
    'Mass',
    'Time',
    'Digital Storage',
    'Energy',
    'Currency',
  ];

  static const _baseColors = <Color>[
    Colors.teal,
    Colors.orange,
    Colors.pinkAccent,
    Colors.blueAccent,
    Colors.yellow,
    Colors.greenAccent,
    Colors.purpleAccent,
    Colors.red,
  ];

  static const _icons = <IconData>[
    Icons.favorite,
    Icons.cake,
    Icons.ac_unit,
    Icons.access_alarm,
    Icons.account_tree,
    Icons.android,
    Icons.wysiwyg,
    Icons.animation,
  ];

  Widget _buildCategoryWidgets(List<Category> contents) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        var content = contents[index];
        return CategoryCell(
          category: content,
        );
      },
      itemCount: contents.length,
    );
  }

  List<Unit> _retrieveUnitList(String categoryName) {
    return List.generate(10, (index) {
      index += 1;
      return Unit(
        name: "$categoryName Unit $index",
        conversion: index.toDouble(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final contents = <Category>[];

    for (var i = 0; i < _categoryNames.length; i++) {
      contents.add(
        Category(
          text: _categoryNames[i],
          color: _baseColors[i],
          iconData: _icons[i],
          units: _retrieveUnitList(_categoryNames[i]),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          'Unit Converter',
          style: TextStyle(
            fontSize: 30.0,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: _buildCategoryWidgets(contents),
      ),
    );
  }
}