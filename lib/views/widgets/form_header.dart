import 'package:flutter/material.dart';

class FormHeader extends StatelessWidget {
  final String title;
  final String description;

  const FormHeader({
    Key key,
    @required this.title,
    this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.headline5,
              ),
              SizedBox(height: 10),
              Text(
                description ?? '',
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
