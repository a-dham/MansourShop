import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mansour_shop/business%20logic/cubit/cubitSignUp/sign_up_states.dart';

class SignUpCubit extends Cubit<SignUpStates>{
  // SignUpCubit(super.initialState);
  SignUpCubit () : super(InitialStateSignUp());

static SignUpCubit get(context) => BlocProvider.of(context);

UserSignUp(){}
}