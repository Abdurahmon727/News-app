// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again:
// With a Flutter package, run `flutter pub run build_runner build`.
// With a Dart package, run `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types, depend_on_referenced_packages
// coverage:ignore-file

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'features/home/data/models/news.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(1, 2933084354991952865),
      name: 'NewsModel',
      lastPropertyId: const IdUid(7, 7829076941298851519),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 5986764675702762474),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 6003870950996303858),
            name: 'title',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 6850325960090626753),
            name: 'author',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 8611797961037364529),
            name: 'publishedDate',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 4351001614750633718),
            name: 'excerpt',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(6, 1313709755973666203),
            name: 'media',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(7, 7829076941298851519),
            name: 'summary',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[])
];

/// Open an ObjectBox store with the model declared in this file.
Future<Store> openStore(
        {String? directory,
        int? maxDBSizeInKB,
        int? fileMode,
        int? maxReaders,
        bool queriesCaseSensitiveDefault = true,
        String? macosApplicationGroup}) async =>
    Store(getObjectBoxModel(),
        directory: directory ?? (await defaultStoreDirectory()).path,
        maxDBSizeInKB: maxDBSizeInKB,
        fileMode: fileMode,
        maxReaders: maxReaders,
        queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
        macosApplicationGroup: macosApplicationGroup);

/// ObjectBox model definition, pass it to [Store] - Store(getObjectBoxModel())
ModelDefinition getObjectBoxModel() {
  final model = ModelInfo(
      entities: _entities,
      lastEntityId: const IdUid(1, 2933084354991952865),
      lastIndexId: const IdUid(0, 0),
      lastRelationId: const IdUid(0, 0),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [],
      retiredPropertyUids: const [],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    NewsModel: EntityDefinition<NewsModel>(
        model: _entities[0],
        toOneRelations: (NewsModel object) => [],
        toManyRelations: (NewsModel object) => {},
        getId: (NewsModel object) => object.id,
        setId: (NewsModel object, int id) {
          object.id = id;
        },
        objectToFB: (NewsModel object, fb.Builder fbb) {
          final titleOffset = fbb.writeString(object.title);
          final authorOffset = fbb.writeString(object.author);
          final publishedDateOffset = object.publishedDate == null
              ? null
              : fbb.writeString(object.publishedDate!);
          final excerptOffset =
              object.excerpt == null ? null : fbb.writeString(object.excerpt!);
          final mediaOffset =
              object.media == null ? null : fbb.writeString(object.media!);
          final summaryOffset =
              object.summary == null ? null : fbb.writeString(object.summary!);
          fbb.startTable(8);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, titleOffset);
          fbb.addOffset(2, authorOffset);
          fbb.addOffset(3, publishedDateOffset);
          fbb.addOffset(4, excerptOffset);
          fbb.addOffset(5, mediaOffset);
          fbb.addOffset(6, summaryOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = NewsModel(
              title: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 6, ''),
              author: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 8, ''),
              publishedDate: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 10),
              excerpt: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 12),
              media: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 14),
              summary: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 16))
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);

          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [NewsModel] entity fields to define ObjectBox queries.
class NewsModel_ {
  /// see [NewsModel.id]
  static final id = QueryIntegerProperty<NewsModel>(_entities[0].properties[0]);

  /// see [NewsModel.title]
  static final title =
      QueryStringProperty<NewsModel>(_entities[0].properties[1]);

  /// see [NewsModel.author]
  static final author =
      QueryStringProperty<NewsModel>(_entities[0].properties[2]);

  /// see [NewsModel.publishedDate]
  static final publishedDate =
      QueryStringProperty<NewsModel>(_entities[0].properties[3]);

  /// see [NewsModel.excerpt]
  static final excerpt =
      QueryStringProperty<NewsModel>(_entities[0].properties[4]);

  /// see [NewsModel.media]
  static final media =
      QueryStringProperty<NewsModel>(_entities[0].properties[5]);

  /// see [NewsModel.summary]
  static final summary =
      QueryStringProperty<NewsModel>(_entities[0].properties[6]);
}