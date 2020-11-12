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
                      Expanded(
                        flex  : 8,
                        child :FlatButton(
                          color     : Colors.grey[200 + index % 2 * 100],
                          onPressed : (){
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) {
                                return TodoDetailPage(todoItem: items[index]);
                              }),
                            );
                          },
                          height    : 100 ,
                          child     : Text('#${index+1}: ${items[index]}', overflow: TextOverflow.ellipsis,),
                        ),
                      ),
                      Expanded(
                        flex  : 2,
                        child : FlatButton(
                          color     : Colors.grey[200 + index % 2 * 100],
                          onPressed : (){
                            setState(() {
                              items.removeAt(index);
                            });
                          },
                          height    : 100 ,
                          child     : Icon(Icons.delete, color: Colors.red),
                        ),
                      ),
                    ],
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

class TodoDetailPage extends StatelessWidget {
  final String todoItem;
  TodoDetailPage({this.todoItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('TODO 詳細'),
        ),
        body: Column(
            children: <Widget>[
              Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 50,
                      child: Text(
                        todoItem,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize:24,
                            color: Colors.blue,
                        ),
                      ),
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
                      child: FlatButton(
                        color: Colors.blue,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('戻る', style: TextStyle(color: Colors.white)),
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