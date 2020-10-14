import 'package:udacity_course_app/models/category.dart';
import 'package:udacity_course_app/ui/converter_route.dart';
import 'package:flutter/material.dart';

class CategoryCell extends StatelessWidget {
  final Category category;

  const CategoryCell({
    Key key,
    @required this.category,
  })  : assert(category != null),
        super(key: key);

  void _navigateToConverter(BuildContext context) {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: category.color,
              elevation: 1.0,
              title: Text(
                category.text,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              centerTitle: true,
            ),
            body: ConverterRoute(
              units: category.units,
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var _height = 100.0;

    return Material(
      color: Colors.transparent,
      child: Center(
        child: Container(
          padding: EdgeInsets.all(8.0),
          height: _height,
          child: InkWell(
            borderRadius: BorderRadius.all(Radius.circular(_height / 2)),
            highlightColor: category.color,
            splashColor: category.color,
            onTap: () {
              print("I was tapped!");
              _navigateToConverter(context);
            },
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Icon(
                      category.iconData,
                      size: 60.0,
                    ),
                  ),
                  Center(
                    child: Text(
                      category.text,
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
