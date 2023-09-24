import 'dart:html';
import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_novel_sys/entity/ResponceParam/ChapterPOJO.dart';
import 'package:new_novel_sys/entity/ResponceParam/ChapterResponce.dart';
import 'package:new_novel_sys/utils/NetworkRequest.dart';
import 'package:new_novel_sys/view/ContentView.dart';
import 'package:new_novel_sys/view/Dashboard.dart';

class ChapterView extends StatelessWidget {
  ChapterView({Key? key, required this.responce}) : super(key: key);
  final ChapterResponce responce;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 20,),
            backWid(context),
            SizedBox(height: 40,),
            basicInfoWid(),
            Flexible(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    for(int i=0;i<responce.data!.chapterList!.length; i++)
                      chapterLinksWid(context, responce.data!.chapterList![i])
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }

  Widget basicInfoWid() {
    return Card(
      child: Column(
        children: [
          Row(
            children: [
              Flexible(
                child: ListTile(
                  leading: Text(responce.data!.title!),
                  title: Text(responce.data!.author!),
                  subtitle: Text(responce.data!.descs!),
                  trailing: Image.network(responce.data!.cover!),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget chapterLinksWid(BuildContext context ,ChapterList item) {
    return Card(
      child: ListTile(
        leading: Text(item.title!),
        onTap: () async {
          //read content
          try{
            var ret = await NetworkRequestUtils.instance.getContentByChapter(item.chapterId!);
            //jump to new page
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ContentView(responce: ret)));
          }catch(e){
            print(e);
          }
        },
      ),
    );
  }

  Widget backWid(BuildContext context) {
    return ElevatedButton(
        onPressed: (){
          Navigator.pop(context);
        }, child: Text('back')
    );
  }

}
