import 'package:audioplayers/audioplayers.dart';
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
  bool isChecked = false;
  List<Color> _colors = [
    Colors.red,
    Colors.blue,
    Colors.teal,
    Colors.brown,
    Colors.pink
  ];
  Color checkedColor = Colors.black;
  AudioPlayer audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    words = fetchWords(baseURL,widget.unitId);
  }
  play(url) async {
    int result = await audioPlayer.play(baseURL+'/audio/'+url);
    if (result == 1) {
      // success
    }
  }
  @override
  Widget build(BuildContext context) {
//    List<Widget> checkboxes = [];
//    _colors.map((color)=> debugPrint(color.toString()));
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
                            leading: Image.network(
                              '$baseURL/image/${snapshot.data[index].image}',
                              height: 50,
                              width: 50,
                              scale: 0.6,
                              fit: BoxFit.fill,
                            ),
                            title: Row(children: <Widget>[
                              Text(snapshot.data[index].name + " ",style: TextStyle(color: Colors.red),),
                              Icon(
                                Icons.volume_up,
                                color: Colors.green,
                                size: 24.0,
                              ),
                              Text(snapshot.data[index].translated_name,style: TextStyle(fontSize: 12,),)
                            ]),
                            subtitle: Text(snapshot.data[index].description),
                            onTap: (){play(snapshot.data[index].sound);},
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[

                              Theme(
                                data: ThemeData(unselectedWidgetColor: Colors.yellow),
                                child: Checkbox(
                                  value: isChecked,
                                  tristate: false,
                                  activeColor: Colors.yellow,
                                  checkColor: checkedColor,
                                  onChanged: (bool value) {
                                    setState(() { isChecked = !isChecked;});
                                  },
                                ),
                              ),
                              Theme(
                                data: ThemeData(unselectedWidgetColor: Colors.blue),
                                child: Checkbox(
                                  value: isChecked,
                                  tristate: false,
                                  activeColor: Colors.blue,
                                  checkColor: checkedColor,

                                  onChanged: (bool value) {
                                    setState(() { isChecked = !isChecked;});
                                  },
                                ),
                              ),
                              Theme(
                                data: ThemeData(unselectedWidgetColor: Colors.green),
                                child: Checkbox(
                                  value: isChecked,
                                  tristate: false,
                                  activeColor: Colors.green,
                                  checkColor: checkedColor,

                                  onChanged: (bool value) {
                                    setState(() { isChecked = !isChecked;});
                                  },
                                ),
                              ),
                              Theme(
                                data: ThemeData(unselectedWidgetColor: Colors.red),
                                child: Checkbox(
                                  value: isChecked,
                                  tristate: false,
                                  activeColor: Colors.red,
                                  checkColor: checkedColor,

                                  onChanged: (bool value) {
                                    setState(() { isChecked = !isChecked;});
                                  },
                                ),
                              ),
                              Theme(
                                data: ThemeData(unselectedWidgetColor: Colors.grey),
                                child: Checkbox(
                                  value: isChecked,
                                  tristate: false,
                                  activeColor: Colors.grey,
                                  checkColor: checkedColor,

                                  onChanged: (bool value) {
                                    setState(() { isChecked = !isChecked;});
                                  },
                                ),
                              ),



                            ],
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
        bottomNavigationBar: BottomAppBar(
          child: Row(
            children: <Widget>[
              IconButton(icon: Icon(Icons.menu), onPressed: () {},),
              IconButton(icon: Icon(Icons.search), onPressed: () {},),
              SizedBox(
                height: 40,
                width: 100,
                child: Container(
                  decoration: new BoxDecoration(
                      color: Colors.green,
                      borderRadius: new BorderRadius.circular(40.0)
                  ),
                  child: Center(
                    child: Text('Chowi'),
                  ),

                ),
              )


            ],
          ),
        ),

        drawer: navigationDrawer(context)

    );
  }
}

