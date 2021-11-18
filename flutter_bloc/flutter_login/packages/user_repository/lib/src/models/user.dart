import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User(this.id);

  final String id;

  /// package:equatable is used to enable value comparisons of the User object.
  @override
  List<Object> get props => [id];

  static const empty = User("-");
}
