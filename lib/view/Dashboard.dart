import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:new_novel_sys/entity/ResponceParam/NovelResponce.dart';
import 'package:new_novel_sys/entity/requestParam/SearchType.dart';
import 'package:new_novel_sys/utils/NetworkRequest.dart';
import 'package:new_novel_sys/view/NovelViewStless.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late NovelResponce responce;
  bool isLoading = true;
  late SearchType type;
  late String key;
  late int page;
  int totalPage = 0;
  TextEditingController searchctl = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    responce = NovelResponce();
    type = SearchType.title;
    key = '';
    page = 1;
  }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: Container(
       child: Center(
         child: Column(
           children: [
             const SizedBox(height: 20,),
             const Text('Budy Novel searching system',
             style: TextStyle(
               fontWeight: FontWeight.w700,
               fontSize: 30,
             ),
             ),
             const SizedBox(height: 20,),
             searchWid(context, searchctl),
             const SizedBox(height: 20,),
             RadiosWid(context, ),
             const SizedBox(height: 30,),
             isLoading ?
             Center(
               child: Container(
                 child: CircularProgressIndicator(),
               ),
             ) : Flexible(
                 child: NovelViewStless(responce: responce),
             ),
             const SizedBox(height: 30,),
             pageChangeWid(context),
           ],
         ),
       ),
     ),
   );
  }


  Widget RadiosWid(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 40,),
        Text('search by:'),
        SizedBox(width: 10,),
        Text('title'),
        Radio(value: SearchType.title, groupValue: this.type, onChanged: (value){
          setState(() {
            this.type = value!;
          });
        }),
        SizedBox(width: 10,),
        Text('author'),
        Radio(value: SearchType.author, groupValue: this.type, onChanged: (value){
          setState(() {
            this.type = value!;
          });
        })
      ],
    );
  }

  Widget searchWid(BuildContext context, TextEditingController _controller) {
    return Flexible(
        child: Row(
          children: [
            SizedBox(width: 40,),
            Flexible(
              child: TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  labelText: 'Search bar',
                  hintText: 'input search novel',
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            const SizedBox(width: 40,),
            ElevatedButton(onPressed: (){
              if (searchctl.text.isEmpty) {
                return;
              }
              setState(() {
                page = 1;
                key = searchctl.text;
              });
              NetworkRequestUtils.instance.getNovels(type, key, page.toString()).then((value){
                setState(() {
                  if (value.data!=null) {
                    isLoading = false;
                    if (value.data!.length%10!=0) {
                        totalPage=(value.data!.length/10+1) as int;
                    }else{
                      totalPage=(value.data!.length/10) as int;
                    }
                    responce = value;
                  }
                });
              });
            }, child: const Text('search')),
            const SizedBox(width: 40,),
          ],
        ));
  }

  Widget pageChangeWid(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(width: 50,),
        ElevatedButton(onPressed:page> 1? (){
          try{
            setState(() {
              isLoading = true;
                page--;
                NetworkRequestUtils.instance.getNovels(
                    type, key, page.toString()).then((value) {
                  setState(() {
                    isLoading = false;
                    if (value.data == null) {
                      return;
                    } else {
                      responce = value;
                    }
                  });
                });
            });
          }catch(e){
            Fluttertoast.showToast(msg: 'out of page index');
          }
        }: null, child: const Text('prev Page')),
        const SizedBox(width: 10,),
        SizedBox(width: 20,
        child: Text(page.toString()),
        ),
        ElevatedButton(onPressed:page<=totalPage ? (){
          try{
            setState(() {
              isLoading = true;
                page++;
                NetworkRequestUtils.instance.getNovels(
                    type, key, page.toString()).then((value) {
                  setState(() {
                    if (value.data == null) {
                      return;
                    } else {
                      isLoading = false;
                      responce = value;
                    }
                  });
                });
            });
          }catch(e){
            Fluttertoast.showToast(msg: 'out of page index');
          }
        }: null, child: const Text('next Page')),
        const SizedBox(width: 50,),
      ],
    );
  }
}



