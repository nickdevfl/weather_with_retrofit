class City{
  int woeid;
  String title;

  City({
    required this.woeid,
    required this.title,
  });

  factory City.fromJson(Map<String, dynamic> json){
    return City(
      woeid : int.parse(json['woeid']),
      title : json['title'] as String,
    );
  }

}