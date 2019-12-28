import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hoclieu_clone_0_4/Constant/APIConstant.dart';
import 'package:http/http.dart' as http;

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

Future<void> checkUser(baseURL,email) async {
  final response = await http.get('$baseURL/user/$email',);
  if (response.statusCode != 200) {
    throw Exception('Failed to load data');
  }
}
Future<List> signInWithGoogle() async {
  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  try{
    final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );
    final  FirebaseUser user = await _auth.signInWithCredential(credential);
//  final FirebaseUser user = authResult.user;

    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final FirebaseUser currentUser = await _auth.currentUser();
    assert(user.uid == currentUser.uid);
//    print('${user}');
    checkUser(baseURL, user.email);
    return [true,user];
    
  }catch(Exception){
    print(Exception.toString());
    return  [false,null];
  }

}


void signOutGoogle() async{
  await googleSignIn.signOut();

  print("User Sign Out");
}

Widget signInButton(data,context,callback) {
  return OutlineButton(
    splashColor: Colors.grey,
    onPressed: () {
      signInWithGoogle().whenComplete((){}).then((isAuthenticate) {
        if(isAuthenticate[0]){
          callback(isAuthenticate);
//          Navigator.of(context).push(
//            MaterialPageRoute(
//              builder: (context) {
//                return FirstScreen();
//              },
//            ),
//          );
        }

      }
      );
    },
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
    highlightElevation: 0,
    borderSide: BorderSide(color: Colors.grey),
    child: Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image(image: AssetImage("assets/google_logo.png"), height: 35.0),

          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              'Sign in with $data',
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey,
              ),
            ),
          )
        ],
      ),
    ),
  );
}
