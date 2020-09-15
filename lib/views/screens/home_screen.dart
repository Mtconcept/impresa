import 'package:flutter/material.dart';
import 'package:impresa/views/widgets/white_status_bar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WhiteStatusBar(
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              homeHeader(context),
              SizedBox(height: 4.0),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget homeHeader(BuildContext context) => Container(
        padding: EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Choose A\nTemplate',
              style: Theme.of(context).textTheme.headline1,
            ),
            SizedBox(height: 4.0),
            Text(
              'Start customizing your business life',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            SizedBox(height: 24.0),
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search Template',
                fillColor: Color(0xFFF9F9F9),
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      );
}
