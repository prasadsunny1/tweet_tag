import 'package:flutter/material.dart';
import 'twitterService.dart';

void main() => runApp(MyTwitterApp());

class MyTwitterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text("Tag Twitter"),
            elevation: 0,
            centerTitle: true,
          ),
          body: AppBody(),
        ),
      ),
    );
  }
}

class AppBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new TweetInput(),
    );
  }
}

class TweetInput extends StatefulWidget {
  const TweetInput({
    Key key,
  }) : super(key: key);

  @override
  TweetInputState createState() {
    return new TweetInputState();
  }
}

class TweetInputState extends State<TweetInput> {
  String text = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        TextField(
          autocorrect: true,
          decoration: InputDecoration(labelText: "Tweet Message",hintText: "Tweet Message"),
          onChanged: (String value) {
            text = value;
          },
        ),
        new Builder(
          builder: (BuildContext context) {
            return new RaisedButton(
              child: const Text('Share To Twitter'),
              onPressed: text.isEmpty
                  ? null
                  : () {
                      sendTextMessage(message: text);
                    },
            );
          },
        ),
      ],
    );
  }
}
