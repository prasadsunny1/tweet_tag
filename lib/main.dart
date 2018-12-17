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
  final _formKey = GlobalKey<FormState>();

  String validate(String value) {
    if (value.isEmpty) {
      return "Please Enter Tweet.";
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: TextFormField(
              maxLength: 280,
              decoration: InputDecoration(
                labelText: "Tweet Message",
                hintText: "Tweet Message",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.message),
              ),
              autocorrect: true,
              keyboardType: TextInputType.text,
              validator: (value) {
                return validate(value);
              },
              onSaved: (value) => text = value,
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 16),
            child: RaisedButton(
              child: const Text('Tweet it!'),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32)),
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () {
                final form = _formKey.currentState;
                if (form.validate()) {
                  form.save();
                  sendTextMessage(message: text);
                }
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Wrap(
            spacing: 8,
            children: [
              Chip(
                label: Text("#Hastag"),
              ),
              Chip(
                label: Text("#Hastag"),
              ),
              Chip(
                label: Text("#Hastag"),
              ),
              Chip(
                label: Text("#Hastag"),
              ),
              Chip(
                label: Text("#Hastag"),
              ),
              Chip(
                label: Text("#Hastag"),
              ),
              Chip(
                label: Text("#Hastag"),
              ),
              Chip(
                label: Text("#Hastag"),
              ),
              Chip(
                label: Text("#Hastag"),
              ),
            ],
          ),
        )
      ],
    );
  }
}
