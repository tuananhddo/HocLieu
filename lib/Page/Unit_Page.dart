import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hoclieu_clone_0_4/Constant/APIConstant.dart';
import 'package:hoclieu_clone_0_4/Page/WordPage.dart';
import 'NavigationDrawer.dart';
import '../fetchData/Unit.dart';
class UnitsPage extends StatefulWidget {

  final String title = 'Unit Page';
  final int bookId;
  final FirebaseUser user;

  UnitsPage({Key key,this.bookId,this.user}) : super(key: key);

  @override
  _UnitPageState createState() => new _UnitPageState();
}
class _UnitPageState extends State<UnitsPage>{
  Future<List<Unit>> units;

  @override
  void initState() {
    super.initState();
    units = fetchUnits(baseURL,widget.bookId);
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(title: Text("Unit")),
        body: Center(
          child: FutureBuilder<List<Unit>>(
            future: units,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context,int index){
                    return Column(
                        children: <Widget>[
                          ListTile(
                            title: Row(children: <Widget>[
                                Text('Unit ' + snapshot.data[index].unit_number.toString() + '\t',style: TextStyle(color: Colors.blue),),
                                Text(snapshot.data[index].unit_name != null ? snapshot.data[index].unit_name : ""),
                            ]),
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => WordsPage(unit : snapshot.data[index],user: widget.user,)),
                              );
                            },
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

