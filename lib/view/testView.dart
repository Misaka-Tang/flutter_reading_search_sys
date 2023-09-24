import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_novel_sys/entity/requestParam/SearchType.dart';
import 'package:new_novel_sys/utils/NetworkRequest.dart';

class testView extends StatefulWidget {
  const testView({Key? key}) : super(key: key);

  @override
  State<testView> createState() => _testViewState();
}

class _testViewState extends State<testView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed:(){
              NetworkRequestUtils.instance.getNovels(SearchType.title,'hello','1');
            }, child: Text('data')),
            ElevatedButton(onPressed: (){
              NetworkRequestUtils.instance.getChaptersByNovel('e8bc8dd5-8877-3da6-ac96-3ede6ed61834');
            }, child: Text('data2')),
            ElevatedButton(onPressed: (){
              NetworkRequestUtils.instance.getContentByChapter('a61473b8-31d7-371e-9846-89b3e80f39b2');
            }, child: Text('data3'))
          ],
        ),
      ),
    );
  }
}
