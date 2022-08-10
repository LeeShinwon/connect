import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'folder_list.dart';

class FolderScreen extends StatefulWidget {
  const FolderScreen({Key? key}) : super(key: key);

  @override
  State<FolderScreen> createState() => _FolderScreenState();
}

class _FolderScreenState extends State<FolderScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: FolderList()),
      ],
    );
  }
}
