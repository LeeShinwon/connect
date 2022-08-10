import 'package:connect/community/teacher_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'announce_list.dart';
class Community extends StatefulWidget {
  const Community({Key? key}) : super(key: key);

  @override
  State<Community> createState() => _CommunityState();
}

class _CommunityState extends State<Community> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AnnounceChange(),
      child: ListView(
        children: <Widget>[
          TeacherList(),
          AnnounceList(),
        ],
      ),
    );
  }
}

class AnnounceChange with ChangeNotifier {
  String teacherID = '6KtBHm92owdhRA4PtX89l8LgP4C3';
  String get tempID => teacherID;

  void changeTeacher(tempID) {
    teacherID = tempID;
    notifyListeners();
  }
}