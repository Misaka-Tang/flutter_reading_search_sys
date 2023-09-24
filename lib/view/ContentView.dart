import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_novel_sys/entity/ResponceParam/ContentResponce.dart';
import 'package:new_novel_sys/view/ChapterView.dart';

class ContentView extends StatelessWidget {
  ContentView({Key? key, required this.responce}) : super(key: key);
  final ContentResponce responce;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          children: [
            SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
              Navigator.pop(context);
            }, child: Text('back to chapters')),
            Flexible(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(responce.data!.toString(),
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                    ) ,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
