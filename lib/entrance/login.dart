import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'authentication.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  CollectionReference database = FirebaseFirestore.instance.collection('user');
  late QuerySnapshot querySnapshot;

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/icon/logo.png', width: 100,),
            const SizedBox(height: 10,),
            const Text(
              'CONNECT',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
                fontFamily: "DoHyeonFont",
              ),

            ),
            Text('쉬운 소통으로 세상과 연결합니다.',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w600,
              ),),
            SizedBox(height: 100,),
            ElevatedButton(
              onPressed: () async {
                final UserCredential userCredential =
                    await signInWithGoogle();

                User? user = userCredential.user;

                if (user != null) {
                  int i;
                  querySnapshot = await database.get();

                  for (i = 0; i < querySnapshot.docs.length; i++) {
                    var a = querySnapshot.docs[i];

                    if (a.get('uid') == user.uid) {
                      break;
                    }
                  }

                  if (i == (querySnapshot.docs.length)) {
                    database.doc(user.uid).set({
                      'email': user.email.toString(),
                      'name': user.displayName.toString(),
                      'uid': user.uid,
                    });
                  }

                  Get.to(Authentication());
                }
              },
              child: Text('시작하기',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                  fontSize: 15,

                ),
              ),
              style: ElevatedButton.styleFrom(
                  primary: Color(0xFFFFC700),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),

                  shadowColor: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 70)
              ),
            )
          ],
        ),
      ),
    );
  }
}
