import 'package:flutter/material.dart';

class chat extends StatefulWidget {
  const chat({Key? key}) : super(key: key);

  @override
  State<chat> createState() => _chatState();
}

class _chatState extends State<chat> {
  List<String> items = ['Item 1', 'Item 2', 'Item 3', 'Item 4', 'Item 5', 'Item 6'];
  var selectedValue;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body:ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: 50,
            height: 50,
            color: Colors.blue,
            child: RadioListTile(

              shape: CircleBorder(),
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
              dense: true,
              controlAffinity: ListTileControlAffinity.trailing,


              title: Text(items[index]),
              value: items[index],
              groupValue: selectedValue,
              onChanged: ( value) {
                setState(() {
                  selectedValue = value!;
                });
              },
            ),
          );
        },
      )
    );
  }
}
