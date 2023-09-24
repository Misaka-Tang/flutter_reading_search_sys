import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_novel_sys/entity/ResponceParam/ChapterResponce.dart';
import 'package:new_novel_sys/entity/ResponceParam/NovelPOJO.dart';
import 'package:new_novel_sys/entity/ResponceParam/NovelResponce.dart';
import 'package:new_novel_sys/entity/requestParam/SearchType.dart';
import 'package:new_novel_sys/main.dart';
import 'package:new_novel_sys/utils/NetworkRequest.dart';
import 'package:new_novel_sys/view/ChapterView.dart';

class NovelViewStless extends StatelessWidget {
  NovelResponce responce;
  NovelViewStless({super.key, required this.responce});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Center(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children:  [
                Card(
                  child: Column(
                    children: [
                      for(int i=0;i<responce.data!.length;i++)
                        novelBasicInfoWid(context, responce.data![i]),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget novelBasicInfoWid(BuildContext context, NovelPOJO pojo) {
    return Card(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Flexible(
                  child: ListTile(
                    leading: Text(pojo.author!, overflow: TextOverflow.ellipsis),
                    title: Text(pojo.title!),
                    subtitle: Text(pojo.descs!, maxLines: 3,overflow: TextOverflow.ellipsis,),
                  ),
                ),
                Image.network(pojo.cover!,
                  width: 100, height: 100,)
              ],
            ),
            ElevatedButton(onPressed: () async {
              ChapterResponce ret = await NetworkRequestUtils.instance.
                                                          getChaptersByNovel(pojo.fictionId!);
              Navigator.push(
                context, MaterialPageRoute(builder: (context)=>ChapterView(responce: ret,)));
            }, child: Text('Read')),
            SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
}



