import 'package:flutter/material.dart';
import 'dart:math';

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
            Indicator(),
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


class _IndicatorPainter extends CustomPainter {
  final double percentage; // 表示された値の割合
  final double textCircleRadius; // 内側に表示される白丸の半径
  _IndicatorPainter({
    @required this.percentage,
    @required this.textCircleRadius,
  });
  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 1; i < (360 * percentage); i += 5) {
      final per = i / 360.0;
      // 割合（0~1.0）からグラデーション色に変換
      final color = ColorTween(
        begin: kColorIndicatorBegin,
        end: kColorIndicatorEnd,
      ).lerp(per);
      final paint = Paint()
        ..color = color
        ..style = PaintingStyle.stroke
        ..strokeWidth = 4;
      final spaceLen = 16; // 円とゲージ間の長さ
      final lineLen = 24; // ゲージの長さ
      final angle = (2 * pi * per) - (pi / 2); // 0時方向から開始するため-90度ずらす
      // 円の中心座標
      final offset0 = Offset(size.width * 0.5, size.height * 0.5);
      // 線の内側部分の座標
      final offset1 = offset0.translate(
        (textCircleRadius + spaceLen) * cos(angle),
        (textCircleRadius + spaceLen) * sin(angle),
      );
      // 線の外側部分の座標
      final offset2 = offset1.translate(
        lineLen * cos(angle),
        lineLen * sin(angle),
      );
      canvas.drawLine(offset1, offset2, paint);
    }
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
class Indicator extends StatelessWidget {
  final percentage = 0.7;
  final size = 164.0;
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _IndicatorPainter(
        percentage: percentage,
        textCircleRadius: size * 0.5,
      ),
      child: Container(
        padding: const EdgeInsets.all(64),
        child: Material(
          color: Colors.white,
          elevation: kElevation,
          borderRadius: BorderRadius.circular(size * 0.5),
          child: Container(
            width: size,
            height: size,
            child: Center(
              child: Text(
                '${percentage * 100}%',
                style: TextStyle(color: kColorPink, fontSize: 48),
              ),
            ),
          ),
        ),
      ),
    );
  }
}