class NovelPOJO {
  String? fictionId;
  String? title;
  String? author;
  String? fictionType;
  String? descs;
  String? cover;
  String? updateTime;

  NovelPOJO(
      {this.fictionId,
        this.title,
        this.author,
        this.fictionType,
        this.descs,
        this.cover,
        this.updateTime});

  NovelPOJO.fromJson(Map<String, dynamic> json) {
    fictionId = json['fictionId'];
    title = json['title'];
    author = json['author'];
    fictionType = json['fictionType'];
    descs = json['descs'];
    cover = json['cover'];
    updateTime = json['updateTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fictionId'] = this.fictionId;
    data['title'] = this.title;
    data['author'] = this.author;
    data['fictionType'] = this.fictionType;
    data['descs'] = this.descs;
    data['cover'] = this.cover;
    data['updateTime'] = this.updateTime;
    return data;
  }
}