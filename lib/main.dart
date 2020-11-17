import 'package:flutter/material.dart';

const kColorPurple = Color(0xFF8337EC);
const kColorPink = Color(0xFFFF006F);
const kColorIndicatorBegin = kColorPink;
const kColorIndicatorEnd = kColorPurple;
const kColorTitle = Color(0xFF616161);
const kColorText = Color(0xFF9E9E9E);
const kElevation = 4.0;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UI Template',
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.white,
        primaryTextTheme: TextTheme(
          headline6: TextStyle(color: kColorTitle),
        ),
        backgroundColor: Colors.white,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text('Main Page'),
        centerTitle: false,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CategoriesButtons(),
          ],
        ),
      ),
    );
  }
}


class _CategoriesButton extends StatelessWidget {
  final String text;
  const _CategoriesButton({
    Key key,
    @required this.text,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.white,
      elevation: kElevation,
      height: 24,
      padding: EdgeInsets.symmetric(horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      onPressed: () {},
      child: Text(
        text,
        style: TextStyle(color: kColorTitle, fontSize: 12),
      ),
    );
  }
}
class CategoriesButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            SizedBox(width: 16),
            _CategoriesButton(text: 'Category 1'),
            SizedBox(width: 16),
            _CategoriesButton(text: 'Category 2'),
            SizedBox(width: 16),
            _CategoriesButton(text: 'Category hogehoge'),
            SizedBox(width: 16),
            _CategoriesButton(text: 'Category fugafuga'),
            SizedBox(width: 16),
          ],
        ),
      ),
    );
  }
}