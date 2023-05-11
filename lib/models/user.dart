import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String id, nama, email;

  UserModel({
    required this.id,
    required this.email,
    required this.nama,
  });
  List<Object?> get props => [id, nama, email];
}
