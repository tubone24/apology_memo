import 'package:flutter/material.dart';
import 'package:rapido/rapido.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ApologyMemo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: ApologyMemo(title: 'ApologyMemo'),
    );
  }
}

class ApologyMemo extends StatefulWidget {
  ApologyMemo({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _ApologyMemoState createState() => _ApologyMemoState();
}

class _ApologyMemoState extends State<ApologyMemo> {
  final DocumentList documentList = DocumentList(
    "apology",
    labels: {
      "Did you get it back?": "done?",
      "Date": "date",
      "Title": "title",
      "Apology": "text",
    },
  );

  // Build a DocumentListScaffold to provide the UI for users to
  // create, edit, and delete documents
  @override
  Widget build(BuildContext context) {
    return DocumentListScaffold(
      documentList,
      title: "ApologyMemo",
      decoration: BoxDecoration(
        image: DecorationImage(
        image: AssetImage(
          "assets/images/background.png",
        ),
    colorFilter: ColorFilter.mode(
        Colors.white.withOpacity(0.3), BlendMode.dstATop),
    ),
        ),
    emptyListWidget: Center(
      child: Text("Let's apologize on that."),
    ),
    customItemBuilder: customItemBuilder,
      );
  }
  Widget customItemBuilder(int index, Document doc, BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    String subString = doc["text"].length > 70 ? doc["text"].substring(0, 70) : doc["text"];

    return Card(
      color: Colors.greenAccent.withOpacity(0.3),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            selected: doc["done?"],
            leading: Icon(Icons.thumb_down, color: Colors.pinkAccent,),
            title: Text(
              doc["title"],
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30.0,
              ),
            ),
            subtitle: Text(subString),
            trailing: DocumentActionsButton(documentList, index: index),
          ),
        ],
      ),
    );
  }
}
