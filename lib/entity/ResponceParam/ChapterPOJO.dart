class Data {
  String? fictionId;
  String? title;
  String? descs;
  String? cover;
  String? author;
  String? fictionType;
  String? updateTime;
  List<ChapterList>? chapterList;

  Data(
      {this.fictionId,
        this.title,
        this.descs,
        this.cover,
        this.author,
        this.fictionType,
        this.updateTime,
        this.chapterList});

  Data.fromJson(Map<String, dynamic> json) {
    fictionId = json['fictionId'];
    title = json['title'];
    descs = json['descs'];
    cover = json['cover'];
    author = json['author'];
    fictionType = json['fictionType'];
    updateTime = json['updateTime'];
    if (json['chapterList'] != null) {
      chapterList = <ChapterList>[];
      json['chapterList'].forEach((v) {
        chapterList!.add(new ChapterList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fictionId'] = this.fictionId;
    data['title'] = this.title;
    data['descs'] = this.descs;
    data['cover'] = this.cover;
    data['author'] = this.author;
    data['fictionType'] = this.fictionType;
    data['updateTime'] = this.updateTime;
    if (this.chapterList != null) {
      data['chapterList'] = this.chapterList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ChapterList {
  String? title;
  String? chapterId;

  ChapterList({this.title, this.chapterId});

  ChapterList.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    chapterId = json['chapterId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['chapterId'] = this.chapterId;
    return data;
  }
}
