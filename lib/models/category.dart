import 'package:udacity_course_app/models/unit.dart';
import 'package:flutter/material.dart';

class Category {
  final String text;
  final ColorSwatch color;
  final IconData iconData;
  final List<Unit> units;

  const Category({
    @required this.text,
    @required this.color,
    @required this.iconData,
    @required this.units,
  })  : assert(text != null),
        assert(color != null),
        assert(iconData != null),
        assert(units != null);
}
