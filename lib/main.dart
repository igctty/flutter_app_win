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
        title: const Text('ホーム'),
        // // TODO: 入力したアイテムを追加できるようにする
        // leading: IconButton(
        //   icon: const Icon(Icons.add),
        //   onPressed: () {
        //     setState(() {
        //       items.add(items.length);
        //     });
        //   },
        // ),
      ),
      // TODO: アイテムタップできるようにする。
      // TODO: アイテムタップしたら詳細に遷移させる。
      // TODO: 削除アイコンつける
      // TODO: 削除アイコンをタップできる
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
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              return TodoAddPage();
            }),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class TodoAddPage extends StatefulWidget {
  @override
  _TodoAddPageState createState() => _TodoAddPageState();
}

class _TodoAddPageState extends State<TodoAddPage> {
  String _context = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('リスト追加'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Text(
                _context, style: TextStyle(color: Colors.blue)
            ),
            TextField(
              onChanged: (String value) {
                setState(() {
                  _context = value;
                });
              },
            ),
            Container(
              width: double.infinity,
              child: RaisedButton(
                color: Colors.blue,
                onPressed: () {},
                child: Text('TODO 追加', style: TextStyle(color: Colors.white)),
              ),
            ),
            Container(
              width: double.infinity,
              child: FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('キャンセル'),
              ),
            ),
          ],
        )
      ),
    );
  }
}