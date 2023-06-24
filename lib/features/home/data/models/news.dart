// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:objectbox/objectbox.dart';

@Entity()
class NewsModel {
  @Id()
  int id = 0;
  final String title;
  final String author;
  final String? publishedDate;
  final String? excerpt;
  final String? media;
  final String topic;
  final String? summary;
  final String? rights;
  NewsModel({
    required this.title,
    required this.author,
    required this.publishedDate,
    required this.excerpt,
    required this.media,
    required this.topic,
    required this.summary,
    required this.rights,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'rights': rights,
      'topic': topic,
      'title': title,
      'author': author,
      'published_date': publishedDate,
      'excerpt': excerpt,
      'media': media,
      'summary': summary,
    };
  }

  factory NewsModel.fromMap(Map<String, dynamic> map) {
    return NewsModel(
      rights: map['rights'] as String?,
      topic: map['topic'] as String,
      title: map['title'] as String,
      author: map['author'] as String,
      publishedDate: map['published_date'] as String?,
      excerpt: map['excerpt'] as String?,
      media: map['media'] as String?,
      summary: map['summary'] as String?,
    );
  }
}
