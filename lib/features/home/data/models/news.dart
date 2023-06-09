class NewsModel {
  final String title;
  final String author;
  final String? publishedDate;
  final String? excerpt;
  final String? media;
  final String? summery;
  NewsModel({
    required this.title,
    required this.author,
    required this.publishedDate,
    required this.excerpt,
    required this.media,
    required this.summery,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'author': author,
      'publishedDate': publishedDate,
      'excerpt': excerpt,
      'media': media,
      'summery': summery,
    };
  }

  factory NewsModel.fromMap(Map<String, dynamic> map) {
    return NewsModel(
      title: map['title'] as String,
      author: map['author'] as String,
      publishedDate: map['publishedDate'] as String?,
      excerpt: map['excerpt'] as String?,
      media: map['media'] as String?,
      summery: map['summery'] as String?,
    );
  }
}
