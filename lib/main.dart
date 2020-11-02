import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const String _title = 'TODO List';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  List<int> items = [0];

  @override
  Widget build(BuildContext context) {
    const Key centerKey = ValueKey('bottom-sliver-list');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add'),
        // TODO: フローティングアクションボタンで右下に＋持っていく
        // TODO: 入力したアイテムを追加できるようにする
        leading: IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            setState(() {
              items.add(items.length);
            });
          },
        ),
      ),
      // TODO: アイテムタップできるようにする。
      // TODO: アイテムタップしたら詳細に遷移させる。
      // TODO: 削除アイコンつける
      // TODO: 削除アイコンをタップするとアイテムを消せる
      // TODO: 削除アイコンをタップするとアイテムを消せる

      body: CustomScrollView(
        center: centerKey,
        slivers: <Widget>[
          SliverList(
            key: centerKey,
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.grey[200 + items[index] % 2 * 100],
                  height: 100 ,
                  child: Text('#${items[index]}: TODO-item'),
                );
              },
              childCount: items.length,
            ),
          ),
        ],
      ),
    );
  }
}