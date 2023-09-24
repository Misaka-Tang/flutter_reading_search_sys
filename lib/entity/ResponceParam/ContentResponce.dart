class ContentResponce {
  String? msg;
  int? code;
  int? count;
  List<String>? data;

  ContentResponce({this.msg, this.code, this.count, this.data});

  ContentResponce.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    code = json['code'];
    count = json['count'];
    data = json['data'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    data['code'] = this.code;
    data['count'] = this.count;
    data['data'] = this.data;
    return data;
  }
}
