import 'SearchType.dart';

class NovelRequest{
  SearchType? searchType;
  String key= ""; //key word to search novel
  int form = 1;
  int size = 10;

  NovelRequest({this.searchType,required this.key,required this.form,required this.size});

}