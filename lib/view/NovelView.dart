import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_novel_sys/entity/ResponceParam/NovelPOJO.dart';
import 'package:new_novel_sys/entity/ResponceParam/NovelResponce.dart';
import 'package:new_novel_sys/entity/requestParam/SearchType.dart';
import 'package:new_novel_sys/utils/NetworkRequest.dart';

class NovelView extends StatefulWidget {
  const NovelView({Key? key}) : super(key: key);

  @override
  State<NovelView> createState() => _NovelViewState();
}

class _NovelViewState extends State<NovelView> {
  late NovelResponce responce;
  bool isLoading = true;
  late String key;
  int currentPage = 1;

  @override
  void initState() {
    // TODO: implement initState
    key='hello';
    NetworkRequestUtils.instance.getNovels(SearchType.title, key, currentPage.toString()).then((value) {
      setState(() {
        isLoading =false;
        responce = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Center(
        child: Container(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Scaffold(
      body: Center(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children:  [
                Card(
                  child: Column(
                    children: [
                      for(int i=0;i<responce.data!.length;i++)
                        novelBasicInfoWid(context, responce.data![i]),
                      PageWid(context)
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
            ElevatedButton(onPressed: (){}, child: Text('Read')),
            SizedBox(height: 10,),
          ],
        ),
      ),
    );
}
}

Widget PageWid (BuildContext context){
  return Center(
    child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){

            }, child: Text('prev Page')),
            SizedBox(width: 30,),
            ElevatedButton(onPressed: (){}, child: Text('next Page')),
          ],
        )
    ),
  );
}
