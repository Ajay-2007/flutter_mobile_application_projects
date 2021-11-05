import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:instagram_BLoC_pattern/models/failure_model.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
}
