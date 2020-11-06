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
  List<String> items = [];

  @override
  Widget build(BuildContext context) {
    const Key centerKey = ValueKey('bottom-sliver-list');
    return Scaffold(
      appBar: AppBar(
        title: const Text('ホーム'),
      ),
      // TODO: アイテムタップしたら詳細に遷移させる。
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
                  child: Row(
                    children: <Widget>[
                      FlatButton(
                        color     : Colors.grey[200 + index % 2 * 100],
                        onPressed : (){},
                        height    : 100 ,
                        child     : Text('#${index+1}: ${items[index]}'),
                      ),
                      IconButton(
                        icon      : Icon(Icons.remove_circle),
                        color     : Colors.red,
                        onPressed : null,
                      ),
                    ]
                  ),
                );
              },
              childCount: items.length,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final todoItemContext = await Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              return TodoAddPage();
            }),
          );
          if (todoItemContext != null) {
            setState(() {
              items.add(todoItemContext);
            });
          }
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
      body: Column(
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                Text(_context, style: TextStyle(color: Colors.blue)),
                TextField(
                  onChanged: (String value) {
                    setState(() {
                      _context = value;
                    });
                  },
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 50,
                  child: RaisedButton(
                    color: Colors.blue,
                    onPressed: () {
                      Navigator.of(context).pop(_context);
                    },
                    child: Text('TODO 追加', style: TextStyle(color: Colors.white)),
                  ),
                ),
                Container(
                  height: 50,
                  child: FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('キャンセル'),
                  ),
                ),
              ],
            ),
          ),
        ]
      )
    );
  }
}