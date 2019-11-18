import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hoclieu_clone_0_4/Page/Unit_Page.dart';
import 'NavigationDrawer.dart';
import '../fetchData/Book.dart';
import '../Constant/APIConstant.dart';
class BooksPage extends StatefulWidget {

  final String title;
  final bool isLogin ;
  final Function(List) handleLogin;
//  final sourceURL = "127.0.0.1:1998/model2.jpg";// change to 10.0.2.2 with local device
  final FirebaseUser user;

  BooksPage({Key key, this.title, this.handleLogin,this.isLogin,this.user}) : super(key: key);

  @override
  _BookPageState createState() => new _BookPageState();
}
class _BookPageState extends State<BooksPage>{
  Future<List<Book>> books;

  @override
  void initState() {
    super.initState();
    books = fetchBooks(baseURL);
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(title: Text("Book")),
        body: Center(
          child: FutureBuilder<List<Book>>(
            future: books,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context,int index){
                    return Column(
                        children: <Widget>[
                          ListTile(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => UnitsPage(bookId: snapshot.data[index].id)),
                              );
                            },
                            leading:new ClipRRect(
                                borderRadius: new BorderRadius.circular(100.0),
                                child:Image.network(
                                  "$baseURL/image/${snapshot.data[index].thumbnail_image}",
                                  height: 50,
                                  width: 50,
                                  scale: 0.6,
                                  fit: BoxFit.fill,
                                )
                            ),
                            title: Text(snapshot.data[index].book_name),
//                            trailing: OutlineButton(
//                                onPressed: (){},
//                                child: Text('Tai Anh'),
//                            ),

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

