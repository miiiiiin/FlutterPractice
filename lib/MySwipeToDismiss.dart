import 'package:flutter/material.dart';

class MySwipeToDismiss extends StatefulWidget {
  @override
  _MySwipeToDismissState createState() => _MySwipeToDismissState();
}

class _MySwipeToDismissState extends State<MySwipeToDismiss> {

  final items = List<String>.generate(20, (i) => "item ${i + 1}"); //lambda
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Swipe to Dismiss"),
      ),
      body: ListView.builder(itemBuilder: (context, index) {
        final item = items[index];
        return Dismissible(
          background: Container(color: Colors.red),
          direction: DismissDirection.startToEnd,
          onDismissed: (direction) {
            setState(() {
//              if (direction == DismissDirection.startToEnd) {
                items.removeAt(index);
//              }
            });
          },
          child: ListTile(title: Text('${items[index]}'),
          ),
          key: Key(item),//각각의 유니크한 값이 키에 할
        );
      }),
    );
  }
}
