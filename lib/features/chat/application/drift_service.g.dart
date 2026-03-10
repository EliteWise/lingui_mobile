// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_service.dart';

// ignore_for_file: type=lint
class $DiscussionsTable extends Discussions
    with TableInfo<$DiscussionsTable, Discussion> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DiscussionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _participantsMeta =
      const VerificationMeta('participants');
  @override
  late final GeneratedColumn<String> participants = GeneratedColumn<String>(
      'participants', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _lastMessageMeta =
      const VerificationMeta('lastMessage');
  @override
  late final GeneratedColumn<String> lastMessage = GeneratedColumn<String>(
      'last_message', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _lastMessageTimeMeta =
      const VerificationMeta('lastMessageTime');
  @override
  late final GeneratedColumn<DateTime> lastMessageTime =
      GeneratedColumn<DateTime>('last_message_time', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _isReadMeta = const VerificationMeta('isRead');
  @override
  late final GeneratedColumn<bool> isRead = GeneratedColumn<bool>(
      'is_read', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_read" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('individual'));
  static const VerificationMeta _imageUrlMeta =
      const VerificationMeta('imageUrl');
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
      'image_url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        title,
        participants,
        lastMessage,
        lastMessageTime,
        isRead,
        type,
        imageUrl
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'discussions';
  @override
  VerificationContext validateIntegrity(Insertable<Discussion> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('participants')) {
      context.handle(
          _participantsMeta,
          participants.isAcceptableOrUnknown(
              data['participants']!, _participantsMeta));
    } else if (isInserting) {
      context.missing(_participantsMeta);
    }
    if (data.containsKey('last_message')) {
      context.handle(
          _lastMessageMeta,
          lastMessage.isAcceptableOrUnknown(
              data['last_message']!, _lastMessageMeta));
    } else if (isInserting) {
      context.missing(_lastMessageMeta);
    }
    if (data.containsKey('last_message_time')) {
      context.handle(
          _lastMessageTimeMeta,
          lastMessageTime.isAcceptableOrUnknown(
              data['last_message_time']!, _lastMessageTimeMeta));
    } else if (isInserting) {
      context.missing(_lastMessageTimeMeta);
    }
    if (data.containsKey('is_read')) {
      context.handle(_isReadMeta,
          isRead.isAcceptableOrUnknown(data['is_read']!, _isReadMeta));
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    }
    if (data.containsKey('image_url')) {
      context.handle(_imageUrlMeta,
          imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Discussion map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Discussion(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      participants: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}participants'])!,
      lastMessage: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}last_message'])!,
      lastMessageTime: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_message_time'])!,
      isRead: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_read'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      imageUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image_url']),
    );
  }

  @override
  $DiscussionsTable createAlias(String alias) {
    return $DiscussionsTable(attachedDatabase, alias);
  }
}

class Discussion extends DataClass implements Insertable<Discussion> {
  final int id;
  final String title;
  final String participants;
  final String lastMessage;
  final DateTime lastMessageTime;
  final bool isRead;
  final String type;
  final String? imageUrl;
  const Discussion(
      {required this.id,
      required this.title,
      required this.participants,
      required this.lastMessage,
      required this.lastMessageTime,
      required this.isRead,
      required this.type,
      this.imageUrl});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['participants'] = Variable<String>(participants);
    map['last_message'] = Variable<String>(lastMessage);
    map['last_message_time'] = Variable<DateTime>(lastMessageTime);
    map['is_read'] = Variable<bool>(isRead);
    map['type'] = Variable<String>(type);
    if (!nullToAbsent || imageUrl != null) {
      map['image_url'] = Variable<String>(imageUrl);
    }
    return map;
  }

  DiscussionsCompanion toCompanion(bool nullToAbsent) {
    return DiscussionsCompanion(
      id: Value(id),
      title: Value(title),
      participants: Value(participants),
      lastMessage: Value(lastMessage),
      lastMessageTime: Value(lastMessageTime),
      isRead: Value(isRead),
      type: Value(type),
      imageUrl: imageUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(imageUrl),
    );
  }

  factory Discussion.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Discussion(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      participants: serializer.fromJson<String>(json['participants']),
      lastMessage: serializer.fromJson<String>(json['lastMessage']),
      lastMessageTime: serializer.fromJson<DateTime>(json['lastMessageTime']),
      isRead: serializer.fromJson<bool>(json['isRead']),
      type: serializer.fromJson<String>(json['type']),
      imageUrl: serializer.fromJson<String?>(json['imageUrl']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'participants': serializer.toJson<String>(participants),
      'lastMessage': serializer.toJson<String>(lastMessage),
      'lastMessageTime': serializer.toJson<DateTime>(lastMessageTime),
      'isRead': serializer.toJson<bool>(isRead),
      'type': serializer.toJson<String>(type),
      'imageUrl': serializer.toJson<String?>(imageUrl),
    };
  }

  Discussion copyWith(
          {int? id,
          String? title,
          String? participants,
          String? lastMessage,
          DateTime? lastMessageTime,
          bool? isRead,
          String? type,
          Value<String?> imageUrl = const Value.absent()}) =>
      Discussion(
        id: id ?? this.id,
        title: title ?? this.title,
        participants: participants ?? this.participants,
        lastMessage: lastMessage ?? this.lastMessage,
        lastMessageTime: lastMessageTime ?? this.lastMessageTime,
        isRead: isRead ?? this.isRead,
        type: type ?? this.type,
        imageUrl: imageUrl.present ? imageUrl.value : this.imageUrl,
      );
  Discussion copyWithCompanion(DiscussionsCompanion data) {
    return Discussion(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      participants: data.participants.present
          ? data.participants.value
          : this.participants,
      lastMessage:
          data.lastMessage.present ? data.lastMessage.value : this.lastMessage,
      lastMessageTime: data.lastMessageTime.present
          ? data.lastMessageTime.value
          : this.lastMessageTime,
      isRead: data.isRead.present ? data.isRead.value : this.isRead,
      type: data.type.present ? data.type.value : this.type,
      imageUrl: data.imageUrl.present ? data.imageUrl.value : this.imageUrl,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Discussion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('participants: $participants, ')
          ..write('lastMessage: $lastMessage, ')
          ..write('lastMessageTime: $lastMessageTime, ')
          ..write('isRead: $isRead, ')
          ..write('type: $type, ')
          ..write('imageUrl: $imageUrl')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, participants, lastMessage,
      lastMessageTime, isRead, type, imageUrl);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Discussion &&
          other.id == this.id &&
          other.title == this.title &&
          other.participants == this.participants &&
          other.lastMessage == this.lastMessage &&
          other.lastMessageTime == this.lastMessageTime &&
          other.isRead == this.isRead &&
          other.type == this.type &&
          other.imageUrl == this.imageUrl);
}

class DiscussionsCompanion extends UpdateCompanion<Discussion> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> participants;
  final Value<String> lastMessage;
  final Value<DateTime> lastMessageTime;
  final Value<bool> isRead;
  final Value<String> type;
  final Value<String?> imageUrl;
  const DiscussionsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.participants = const Value.absent(),
    this.lastMessage = const Value.absent(),
    this.lastMessageTime = const Value.absent(),
    this.isRead = const Value.absent(),
    this.type = const Value.absent(),
    this.imageUrl = const Value.absent(),
  });
  DiscussionsCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String participants,
    required String lastMessage,
    required DateTime lastMessageTime,
    this.isRead = const Value.absent(),
    this.type = const Value.absent(),
    this.imageUrl = const Value.absent(),
  })  : title = Value(title),
        participants = Value(participants),
        lastMessage = Value(lastMessage),
        lastMessageTime = Value(lastMessageTime);
  static Insertable<Discussion> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? participants,
    Expression<String>? lastMessage,
    Expression<DateTime>? lastMessageTime,
    Expression<bool>? isRead,
    Expression<String>? type,
    Expression<String>? imageUrl,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (participants != null) 'participants': participants,
      if (lastMessage != null) 'last_message': lastMessage,
      if (lastMessageTime != null) 'last_message_time': lastMessageTime,
      if (isRead != null) 'is_read': isRead,
      if (type != null) 'type': type,
      if (imageUrl != null) 'image_url': imageUrl,
    });
  }

  DiscussionsCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String>? participants,
      Value<String>? lastMessage,
      Value<DateTime>? lastMessageTime,
      Value<bool>? isRead,
      Value<String>? type,
      Value<String?>? imageUrl}) {
    return DiscussionsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      participants: participants ?? this.participants,
      lastMessage: lastMessage ?? this.lastMessage,
      lastMessageTime: lastMessageTime ?? this.lastMessageTime,
      isRead: isRead ?? this.isRead,
      type: type ?? this.type,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (participants.present) {
      map['participants'] = Variable<String>(participants.value);
    }
    if (lastMessage.present) {
      map['last_message'] = Variable<String>(lastMessage.value);
    }
    if (lastMessageTime.present) {
      map['last_message_time'] = Variable<DateTime>(lastMessageTime.value);
    }
    if (isRead.present) {
      map['is_read'] = Variable<bool>(isRead.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DiscussionsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('participants: $participants, ')
          ..write('lastMessage: $lastMessage, ')
          ..write('lastMessageTime: $lastMessageTime, ')
          ..write('isRead: $isRead, ')
          ..write('type: $type, ')
          ..write('imageUrl: $imageUrl')
          ..write(')'))
        .toString();
  }
}

class $MessagesTable extends Messages with TableInfo<$MessagesTable, Message> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MessagesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _senderIdMeta =
      const VerificationMeta('senderId');
  @override
  late final GeneratedColumn<String> senderId = GeneratedColumn<String>(
      'sender_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _receiverIdMeta =
      const VerificationMeta('receiverId');
  @override
  late final GeneratedColumn<String> receiverId = GeneratedColumn<String>(
      'receiver_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _contentMeta =
      const VerificationMeta('content');
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
      'content', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _isReadMeta = const VerificationMeta('isRead');
  @override
  late final GeneratedColumn<bool> isRead = GeneratedColumn<bool>(
      'is_read', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_read" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('text'));
  static const VerificationMeta _attachmentsMeta =
      const VerificationMeta('attachments');
  @override
  late final GeneratedColumn<String> attachments = GeneratedColumn<String>(
      'attachments', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, senderId, receiverId, content, date, isRead, type, attachments];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'messages';
  @override
  VerificationContext validateIntegrity(Insertable<Message> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('sender_id')) {
      context.handle(_senderIdMeta,
          senderId.isAcceptableOrUnknown(data['sender_id']!, _senderIdMeta));
    } else if (isInserting) {
      context.missing(_senderIdMeta);
    }
    if (data.containsKey('receiver_id')) {
      context.handle(
          _receiverIdMeta,
          receiverId.isAcceptableOrUnknown(
              data['receiver_id']!, _receiverIdMeta));
    } else if (isInserting) {
      context.missing(_receiverIdMeta);
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('is_read')) {
      context.handle(_isReadMeta,
          isRead.isAcceptableOrUnknown(data['is_read']!, _isReadMeta));
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    }
    if (data.containsKey('attachments')) {
      context.handle(
          _attachmentsMeta,
          attachments.isAcceptableOrUnknown(
              data['attachments']!, _attachmentsMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Message map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Message(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      senderId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sender_id'])!,
      receiverId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}receiver_id'])!,
      content: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}content'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      isRead: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_read'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      attachments: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}attachments']),
    );
  }

  @override
  $MessagesTable createAlias(String alias) {
    return $MessagesTable(attachedDatabase, alias);
  }
}

class Message extends DataClass implements Insertable<Message> {
  final int id;
  final String senderId;
  final String receiverId;
  final String content;
  final DateTime date;
  final bool isRead;
  final String type;
  final String? attachments;
  const Message(
      {required this.id,
      required this.senderId,
      required this.receiverId,
      required this.content,
      required this.date,
      required this.isRead,
      required this.type,
      this.attachments});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['sender_id'] = Variable<String>(senderId);
    map['receiver_id'] = Variable<String>(receiverId);
    map['content'] = Variable<String>(content);
    map['date'] = Variable<DateTime>(date);
    map['is_read'] = Variable<bool>(isRead);
    map['type'] = Variable<String>(type);
    if (!nullToAbsent || attachments != null) {
      map['attachments'] = Variable<String>(attachments);
    }
    return map;
  }

  MessagesCompanion toCompanion(bool nullToAbsent) {
    return MessagesCompanion(
      id: Value(id),
      senderId: Value(senderId),
      receiverId: Value(receiverId),
      content: Value(content),
      date: Value(date),
      isRead: Value(isRead),
      type: Value(type),
      attachments: attachments == null && nullToAbsent
          ? const Value.absent()
          : Value(attachments),
    );
  }

  factory Message.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Message(
      id: serializer.fromJson<int>(json['id']),
      senderId: serializer.fromJson<String>(json['senderId']),
      receiverId: serializer.fromJson<String>(json['receiverId']),
      content: serializer.fromJson<String>(json['content']),
      date: serializer.fromJson<DateTime>(json['date']),
      isRead: serializer.fromJson<bool>(json['isRead']),
      type: serializer.fromJson<String>(json['type']),
      attachments: serializer.fromJson<String?>(json['attachments']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'senderId': serializer.toJson<String>(senderId),
      'receiverId': serializer.toJson<String>(receiverId),
      'content': serializer.toJson<String>(content),
      'date': serializer.toJson<DateTime>(date),
      'isRead': serializer.toJson<bool>(isRead),
      'type': serializer.toJson<String>(type),
      'attachments': serializer.toJson<String?>(attachments),
    };
  }

  Message copyWith(
          {int? id,
          String? senderId,
          String? receiverId,
          String? content,
          DateTime? date,
          bool? isRead,
          String? type,
          Value<String?> attachments = const Value.absent()}) =>
      Message(
        id: id ?? this.id,
        senderId: senderId ?? this.senderId,
        receiverId: receiverId ?? this.receiverId,
        content: content ?? this.content,
        date: date ?? this.date,
        isRead: isRead ?? this.isRead,
        type: type ?? this.type,
        attachments: attachments.present ? attachments.value : this.attachments,
      );
  Message copyWithCompanion(MessagesCompanion data) {
    return Message(
      id: data.id.present ? data.id.value : this.id,
      senderId: data.senderId.present ? data.senderId.value : this.senderId,
      receiverId:
          data.receiverId.present ? data.receiverId.value : this.receiverId,
      content: data.content.present ? data.content.value : this.content,
      date: data.date.present ? data.date.value : this.date,
      isRead: data.isRead.present ? data.isRead.value : this.isRead,
      type: data.type.present ? data.type.value : this.type,
      attachments:
          data.attachments.present ? data.attachments.value : this.attachments,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Message(')
          ..write('id: $id, ')
          ..write('senderId: $senderId, ')
          ..write('receiverId: $receiverId, ')
          ..write('content: $content, ')
          ..write('date: $date, ')
          ..write('isRead: $isRead, ')
          ..write('type: $type, ')
          ..write('attachments: $attachments')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, senderId, receiverId, content, date, isRead, type, attachments);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Message &&
          other.id == this.id &&
          other.senderId == this.senderId &&
          other.receiverId == this.receiverId &&
          other.content == this.content &&
          other.date == this.date &&
          other.isRead == this.isRead &&
          other.type == this.type &&
          other.attachments == this.attachments);
}

class MessagesCompanion extends UpdateCompanion<Message> {
  final Value<int> id;
  final Value<String> senderId;
  final Value<String> receiverId;
  final Value<String> content;
  final Value<DateTime> date;
  final Value<bool> isRead;
  final Value<String> type;
  final Value<String?> attachments;
  const MessagesCompanion({
    this.id = const Value.absent(),
    this.senderId = const Value.absent(),
    this.receiverId = const Value.absent(),
    this.content = const Value.absent(),
    this.date = const Value.absent(),
    this.isRead = const Value.absent(),
    this.type = const Value.absent(),
    this.attachments = const Value.absent(),
  });
  MessagesCompanion.insert({
    this.id = const Value.absent(),
    required String senderId,
    required String receiverId,
    required String content,
    required DateTime date,
    this.isRead = const Value.absent(),
    this.type = const Value.absent(),
    this.attachments = const Value.absent(),
  })  : senderId = Value(senderId),
        receiverId = Value(receiverId),
        content = Value(content),
        date = Value(date);
  static Insertable<Message> custom({
    Expression<int>? id,
    Expression<String>? senderId,
    Expression<String>? receiverId,
    Expression<String>? content,
    Expression<DateTime>? date,
    Expression<bool>? isRead,
    Expression<String>? type,
    Expression<String>? attachments,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (senderId != null) 'sender_id': senderId,
      if (receiverId != null) 'receiver_id': receiverId,
      if (content != null) 'content': content,
      if (date != null) 'date': date,
      if (isRead != null) 'is_read': isRead,
      if (type != null) 'type': type,
      if (attachments != null) 'attachments': attachments,
    });
  }

  MessagesCompanion copyWith(
      {Value<int>? id,
      Value<String>? senderId,
      Value<String>? receiverId,
      Value<String>? content,
      Value<DateTime>? date,
      Value<bool>? isRead,
      Value<String>? type,
      Value<String?>? attachments}) {
    return MessagesCompanion(
      id: id ?? this.id,
      senderId: senderId ?? this.senderId,
      receiverId: receiverId ?? this.receiverId,
      content: content ?? this.content,
      date: date ?? this.date,
      isRead: isRead ?? this.isRead,
      type: type ?? this.type,
      attachments: attachments ?? this.attachments,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (senderId.present) {
      map['sender_id'] = Variable<String>(senderId.value);
    }
    if (receiverId.present) {
      map['receiver_id'] = Variable<String>(receiverId.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (isRead.present) {
      map['is_read'] = Variable<bool>(isRead.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (attachments.present) {
      map['attachments'] = Variable<String>(attachments.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MessagesCompanion(')
          ..write('id: $id, ')
          ..write('senderId: $senderId, ')
          ..write('receiverId: $receiverId, ')
          ..write('content: $content, ')
          ..write('date: $date, ')
          ..write('isRead: $isRead, ')
          ..write('type: $type, ')
          ..write('attachments: $attachments')
          ..write(')'))
        .toString();
  }
}

abstract class _$IsarService extends GeneratedDatabase {
  _$IsarService(QueryExecutor e) : super(e);
  $IsarServiceManager get managers => $IsarServiceManager(this);
  late final $DiscussionsTable discussions = $DiscussionsTable(this);
  late final $MessagesTable messages = $MessagesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [discussions, messages];
}

typedef $$DiscussionsTableCreateCompanionBuilder = DiscussionsCompanion
    Function({
  Value<int> id,
  required String title,
  required String participants,
  required String lastMessage,
  required DateTime lastMessageTime,
  Value<bool> isRead,
  Value<String> type,
  Value<String?> imageUrl,
});
typedef $$DiscussionsTableUpdateCompanionBuilder = DiscussionsCompanion
    Function({
  Value<int> id,
  Value<String> title,
  Value<String> participants,
  Value<String> lastMessage,
  Value<DateTime> lastMessageTime,
  Value<bool> isRead,
  Value<String> type,
  Value<String?> imageUrl,
});

class $$DiscussionsTableFilterComposer
    extends Composer<_$IsarService, $DiscussionsTable> {
  $$DiscussionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get participants => $composableBuilder(
      column: $table.participants, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get lastMessage => $composableBuilder(
      column: $table.lastMessage, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastMessageTime => $composableBuilder(
      column: $table.lastMessageTime,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isRead => $composableBuilder(
      column: $table.isRead, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get imageUrl => $composableBuilder(
      column: $table.imageUrl, builder: (column) => ColumnFilters(column));
}

class $$DiscussionsTableOrderingComposer
    extends Composer<_$IsarService, $DiscussionsTable> {
  $$DiscussionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get participants => $composableBuilder(
      column: $table.participants,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get lastMessage => $composableBuilder(
      column: $table.lastMessage, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastMessageTime => $composableBuilder(
      column: $table.lastMessageTime,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isRead => $composableBuilder(
      column: $table.isRead, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get imageUrl => $composableBuilder(
      column: $table.imageUrl, builder: (column) => ColumnOrderings(column));
}

class $$DiscussionsTableAnnotationComposer
    extends Composer<_$IsarService, $DiscussionsTable> {
  $$DiscussionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get participants => $composableBuilder(
      column: $table.participants, builder: (column) => column);

  GeneratedColumn<String> get lastMessage => $composableBuilder(
      column: $table.lastMessage, builder: (column) => column);

  GeneratedColumn<DateTime> get lastMessageTime => $composableBuilder(
      column: $table.lastMessageTime, builder: (column) => column);

  GeneratedColumn<bool> get isRead =>
      $composableBuilder(column: $table.isRead, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get imageUrl =>
      $composableBuilder(column: $table.imageUrl, builder: (column) => column);
}

class $$DiscussionsTableTableManager extends RootTableManager<
    _$IsarService,
    $DiscussionsTable,
    Discussion,
    $$DiscussionsTableFilterComposer,
    $$DiscussionsTableOrderingComposer,
    $$DiscussionsTableAnnotationComposer,
    $$DiscussionsTableCreateCompanionBuilder,
    $$DiscussionsTableUpdateCompanionBuilder,
    (Discussion, BaseReferences<_$IsarService, $DiscussionsTable, Discussion>),
    Discussion,
    PrefetchHooks Function()> {
  $$DiscussionsTableTableManager(_$IsarService db, $DiscussionsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DiscussionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DiscussionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DiscussionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> participants = const Value.absent(),
            Value<String> lastMessage = const Value.absent(),
            Value<DateTime> lastMessageTime = const Value.absent(),
            Value<bool> isRead = const Value.absent(),
            Value<String> type = const Value.absent(),
            Value<String?> imageUrl = const Value.absent(),
          }) =>
              DiscussionsCompanion(
            id: id,
            title: title,
            participants: participants,
            lastMessage: lastMessage,
            lastMessageTime: lastMessageTime,
            isRead: isRead,
            type: type,
            imageUrl: imageUrl,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String title,
            required String participants,
            required String lastMessage,
            required DateTime lastMessageTime,
            Value<bool> isRead = const Value.absent(),
            Value<String> type = const Value.absent(),
            Value<String?> imageUrl = const Value.absent(),
          }) =>
              DiscussionsCompanion.insert(
            id: id,
            title: title,
            participants: participants,
            lastMessage: lastMessage,
            lastMessageTime: lastMessageTime,
            isRead: isRead,
            type: type,
            imageUrl: imageUrl,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$DiscussionsTableProcessedTableManager = ProcessedTableManager<
    _$IsarService,
    $DiscussionsTable,
    Discussion,
    $$DiscussionsTableFilterComposer,
    $$DiscussionsTableOrderingComposer,
    $$DiscussionsTableAnnotationComposer,
    $$DiscussionsTableCreateCompanionBuilder,
    $$DiscussionsTableUpdateCompanionBuilder,
    (Discussion, BaseReferences<_$IsarService, $DiscussionsTable, Discussion>),
    Discussion,
    PrefetchHooks Function()>;
typedef $$MessagesTableCreateCompanionBuilder = MessagesCompanion Function({
  Value<int> id,
  required String senderId,
  required String receiverId,
  required String content,
  required DateTime date,
  Value<bool> isRead,
  Value<String> type,
  Value<String?> attachments,
});
typedef $$MessagesTableUpdateCompanionBuilder = MessagesCompanion Function({
  Value<int> id,
  Value<String> senderId,
  Value<String> receiverId,
  Value<String> content,
  Value<DateTime> date,
  Value<bool> isRead,
  Value<String> type,
  Value<String?> attachments,
});

class $$MessagesTableFilterComposer
    extends Composer<_$IsarService, $MessagesTable> {
  $$MessagesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get senderId => $composableBuilder(
      column: $table.senderId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get receiverId => $composableBuilder(
      column: $table.receiverId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get content => $composableBuilder(
      column: $table.content, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isRead => $composableBuilder(
      column: $table.isRead, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get attachments => $composableBuilder(
      column: $table.attachments, builder: (column) => ColumnFilters(column));
}

class $$MessagesTableOrderingComposer
    extends Composer<_$IsarService, $MessagesTable> {
  $$MessagesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get senderId => $composableBuilder(
      column: $table.senderId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get receiverId => $composableBuilder(
      column: $table.receiverId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get content => $composableBuilder(
      column: $table.content, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isRead => $composableBuilder(
      column: $table.isRead, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get attachments => $composableBuilder(
      column: $table.attachments, builder: (column) => ColumnOrderings(column));
}

class $$MessagesTableAnnotationComposer
    extends Composer<_$IsarService, $MessagesTable> {
  $$MessagesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get senderId =>
      $composableBuilder(column: $table.senderId, builder: (column) => column);

  GeneratedColumn<String> get receiverId => $composableBuilder(
      column: $table.receiverId, builder: (column) => column);

  GeneratedColumn<String> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<bool> get isRead =>
      $composableBuilder(column: $table.isRead, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get attachments => $composableBuilder(
      column: $table.attachments, builder: (column) => column);
}

class $$MessagesTableTableManager extends RootTableManager<
    _$IsarService,
    $MessagesTable,
    Message,
    $$MessagesTableFilterComposer,
    $$MessagesTableOrderingComposer,
    $$MessagesTableAnnotationComposer,
    $$MessagesTableCreateCompanionBuilder,
    $$MessagesTableUpdateCompanionBuilder,
    (Message, BaseReferences<_$IsarService, $MessagesTable, Message>),
    Message,
    PrefetchHooks Function()> {
  $$MessagesTableTableManager(_$IsarService db, $MessagesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MessagesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MessagesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MessagesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> senderId = const Value.absent(),
            Value<String> receiverId = const Value.absent(),
            Value<String> content = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<bool> isRead = const Value.absent(),
            Value<String> type = const Value.absent(),
            Value<String?> attachments = const Value.absent(),
          }) =>
              MessagesCompanion(
            id: id,
            senderId: senderId,
            receiverId: receiverId,
            content: content,
            date: date,
            isRead: isRead,
            type: type,
            attachments: attachments,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String senderId,
            required String receiverId,
            required String content,
            required DateTime date,
            Value<bool> isRead = const Value.absent(),
            Value<String> type = const Value.absent(),
            Value<String?> attachments = const Value.absent(),
          }) =>
              MessagesCompanion.insert(
            id: id,
            senderId: senderId,
            receiverId: receiverId,
            content: content,
            date: date,
            isRead: isRead,
            type: type,
            attachments: attachments,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$MessagesTableProcessedTableManager = ProcessedTableManager<
    _$IsarService,
    $MessagesTable,
    Message,
    $$MessagesTableFilterComposer,
    $$MessagesTableOrderingComposer,
    $$MessagesTableAnnotationComposer,
    $$MessagesTableCreateCompanionBuilder,
    $$MessagesTableUpdateCompanionBuilder,
    (Message, BaseReferences<_$IsarService, $MessagesTable, Message>),
    Message,
    PrefetchHooks Function()>;

class $IsarServiceManager {
  final _$IsarService _db;
  $IsarServiceManager(this._db);
  $$DiscussionsTableTableManager get discussions =>
      $$DiscussionsTableTableManager(_db, _db.discussions);
  $$MessagesTableTableManager get messages =>
      $$MessagesTableTableManager(_db, _db.messages);
}
