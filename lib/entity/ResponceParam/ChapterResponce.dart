import 'ChapterPOJO.dart';

class ChapterResponce {
  String? msg;
  int? code;
  int? count;
  Data? data;

  ChapterResponce({this.msg, this.code, this.count, this.data});

  ChapterResponce.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    code = json['code'];
    count = json['count'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    data['code'] = this.code;
    data['count'] = this.count;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}