
import 'dart:io';

import 'package:dio/io.dart';
import 'package:new_novel_sys/entity/ResponceParam/ContentResponce.dart';
import 'package:new_novel_sys/entity/ResponceParam/NovelResponce.dart';
import 'package:new_novel_sys/entity/requestParam/SearchType.dart';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../entity/ResponceParam/ChapterResponce.dart';

class NetworkRequestUtils{
  // 私有构造函数
  NetworkRequestUtils._privateConstructor(){
    dio.options.headers={
      'content-type': 'multipart/form-data; boundary=---011000010111000001101001',
      "Access-Control-Allow-Origin":"*",
      "Accept":"*/*"
    };
    dio.options.connectTimeout = const Duration(seconds: 5000); // 5s
    dio.options.receiveTimeout = const Duration(seconds: 3000); // 3s

  }
  // 静态私有成员，没有初始化
  static final NetworkRequestUtils _instance = NetworkRequestUtils._privateConstructor();

  // 静态工厂方法
  static NetworkRequestUtils get instance => _instance;

  final basedNovelURL = 'https://api.pingcc.cn/fiction/search';
  final basedChapterURL = 'https://api.pingcc.cn/fictionChapter/search';
  final basedContentURL='https://api.pingcc.cn/fictionContent/search';
  final dio = Dio();
  //send get mathods

  Future<NovelResponce> getNovels(SearchType type, String key, String page) async{
    var url = basedNovelURL;
    NovelResponce model=NovelResponce();
    try{
      Response response;
      switch(type){
        case SearchType.title:
          url+='/title';
          break;
        case SearchType.author:
          url+='/author';
          break;
        case SearchType.fictionType:
          url+='/fictionType';
          break;
      }
      url+='/${key}/${page}/10';
      url = Uri.encodeFull(url);
      print(url);
      response = await dio.get(url);
      if (response.statusCode == 200) {
        model = NovelResponce.fromJson(response.data);
        Fluttertoast.showToast(msg: model.msg!);
        // for(int i = 0;i<model.data!.length;i++){
        //   print(model.data?[i].title);
        // }
      }
      return model;
    }catch(e){
      print(e);
      return model;
    }
  }

  Future<ChapterResponce> getChaptersByNovel(String novelID) async{
    var url = basedChapterURL+'/'+novelID;
    url = Uri.encodeFull(url);
    Response response;
    ChapterResponce model = ChapterResponce();
    try{
      response = await dio.get(url);
      if (response.statusCode == 200) {
        model=ChapterResponce.fromJson(response.data);
        Fluttertoast.showToast(msg: model.msg!);
        // for(int i=0;i<model.data!.chapterList!.length;i++){
        //   print(model.data!.chapterList?[i].chapterId);
        // }
        return model;
      }
    }catch(e){
      print(e);
    }
    return model;
  }

  Future<ContentResponce> getContentByChapter(String chapterID) async{
    var url = basedContentURL+'/'+chapterID;
    url = Uri.encodeFull(url);
    Response response;
    ContentResponce model = ContentResponce();
    try{
      response = await dio.get(url);
      if (response.statusCode==200) {
        model = ContentResponce.fromJson(response.data);
        Fluttertoast.showToast(msg: model.msg!, gravity: ToastGravity.TOP, timeInSecForIosWeb: 5);
      }
    }catch(e){
      print(e);
    }
    return model;
  }

}
