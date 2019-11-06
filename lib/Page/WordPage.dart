import 'package:flutter/material.dart';
import 'package:hoclieu_clone_0_4/Constant/APIConstant.dart';
import 'NavigationDrawer.dart';
import '../fetchData/Word.dart';
class WordsPage extends StatefulWidget {

  final String title = 'Word Page';
  final int unitId;
  WordsPage({Key key,this.unitId}) : super(key: key);

  @override
  _WordPageState createState() => new _WordPageState();
}
class _WordPageState extends State<WordsPage>{
  Future<List<Word>> words;

  @override
  void initState() {
    super.initState();
    words = fetchWords(baseURL,widget.unitId);
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(title: Text("Word")),
        body: Center(
          child: FutureBuilder<List<Word>>(
            future: words,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context,int index){
                    return Column(
                        children: <Widget>[
                          ListTile(
                            title: Row(children: <Widget>[
                              Text(snapshot.data[index].description),
                            ]),
                          ),
                          Divider()
                        ]);
                  },

                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
        ),

        drawer: navigationDrawer(context)
    );
  }
}

