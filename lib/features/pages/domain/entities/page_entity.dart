import 'package:equatable/equatable.dart';

class PageEntity extends Equatable {
  final String? title;
  final String? content;

  const PageEntity({
    this.title,
    this.content,
  });

  @override
  List<Object?> get props => [title, content];
}
