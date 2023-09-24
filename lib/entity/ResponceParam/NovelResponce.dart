import 'package:new_novel_sys/entity/ResponceParam/NovelPOJO.dart';

class NovelResponce {
  String? msg;
  int? code;
  int? count;
  List<NovelPOJO>? data;

  NovelResponce({this.msg, this.code, this.count, this.data});

  NovelResponce.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    code = json['code'];
    count = json['count'];
    if (json['data'] != null) {
      data = <NovelPOJO>[];
      json['data'].forEach((v) {
        data!.add(NovelPOJO.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['msg'] = this.msg;
    data['code'] = this.code;
    data['count'] = this.count;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}