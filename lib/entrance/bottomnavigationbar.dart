import 'package:connect/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../communication/communication.dart';
import '../community/community.dart';




class bottomNavigationbar extends StatefulWidget {
  var user = FirebaseAuth.instance.currentUser;

  @override
  _bottomNavigationbarState createState() => _bottomNavigationbarState();
}

class _bottomNavigationbarState extends State<bottomNavigationbar> {
  int _selectedIndex = 0; //선택한 메뉴의 인덱스를 기억
  //bool _visibility = true; //floating button의 표시 여부 결정'


  //특정 텍스트 스타일을 상수로 지정
  static const TextStyle optionStyle = TextStyle(
      color: Colors.black,
      fontSize: 13,
    fontWeight: FontWeight.w900,
  );

  //메뉴별 다른 AppBar의 텍스트 지정을 위해 List<Text> 선언
  static final List<Widget> _appBarOptions = <Widget>[
    Text('COMMUNITY', style: optionStyle),
    Text('COMNNUNCATION', style: optionStyle),
    Text('MY PAGE', style: optionStyle),
  ];

  //메뉴별 다른 body 지정을 위해 List<Widget> 선언
  static const List<Widget> _bodyOptions = <Widget>[
    Community(),
    Communication(),
    UserPage()
  ];

  //함수 구현
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: false,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.all(5.0),
          child: _appBarOptions.elementAt(_selectedIndex),
        ),

        actions: [
          IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              icon: Icon(
                CupertinoIcons.lock,
                size: 15,
                color: Colors.black,
              )),
        ],
      ),
      body: Center(
        child: _bodyOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person_2_square_stack),
            label: 'community',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.music_albums ),
            label: 'communication',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person),
            label: 'user',
          ),

        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
        backgroundColor: Colors.white,
      )
    );
  }
}


