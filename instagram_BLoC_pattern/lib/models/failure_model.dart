import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final String code;
  final String message;

  const Failure({this.code = '', this.message = ''});

  @override
  // TODO: implement stringify
  bool get stringify => true;

  @override
  List<Object> get props => [code, message];
}
