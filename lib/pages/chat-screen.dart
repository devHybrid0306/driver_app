import 'package:flutter/material.dart';
import '../models/widgetsModel.dart';
import 'package:image_picker/image_picker.dart';

class chatScreenPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
// TODO: implement createState
    return _chatScreenPageState();
  }
}

class _chatScreenPageState extends State<chatScreenPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Customer Support',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromRGBO(222, 150, 92, 1.0),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 10.0),
        color: Colors.grey[300],
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10.0)),
                          child: Text('testing the chat page other side'),
                        )
                      ],
                    ),
                    verticalSizedBox(2, context),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(color: Color.fromRGBO(222, 150, 92, 1.0),borderRadius: BorderRadius.circular(10.0)),
                            child: Text('testing the chat page',style: TextStyle(color: Colors.white),))
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.add,
                    color: Colors.grey,
                    size: 25.0,),
                    onPressed: () async {

                      var image = await ImagePicker.pickImage(
                          source: ImageSource.gallery);
                    },
                  ),
                  horizontalSizedBox(2, context),
                  Container(
                    width: MediaQuery.of(context).size.width * 65 / 100,
                    child: TextField(
                      decoration:
                          InputDecoration(hintText: 'Write Something here...'),
                    ),
                  ),
                  IconButton(icon: Icon(Icons.send), onPressed: null)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
