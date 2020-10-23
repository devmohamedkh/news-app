class NewsArtical {
  final String title;
  final String description;
  final String url;
  final String urlToImage;

  NewsArtical({this.title, this.description, this.url, this.urlToImage});

  factory NewsArtical.fromJson(Map<String, dynamic> json) {
    return NewsArtical(
      title: json['title'],
      description: json['description'],
      url: json['url'],
      urlToImage: json['urlToImage'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    data['url'] = this.url;
    data['urlToImage'] = this.urlToImage;
    return data;
  }
}
