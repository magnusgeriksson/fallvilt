import 'package:equatable/equatable.dart';

class DefaultListItem extends Equatable {
  const DefaultListItem({
    this.text = '',
    this.id = 0,
  });

  final String text;
  final int id;

  @override
  List<Object> get props => [id, text];

  static const empty = DefaultListItem();
}
