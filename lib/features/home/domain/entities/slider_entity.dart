import 'package:equatable/equatable.dart';

class SliderEntity extends Equatable {
  final int? id;
  final String? link;
  final String? image;

  const SliderEntity({
    this.id,
    this.link,
    this.image,
  });

  @override
  List<Object?> get props => [id, link, image];
}
