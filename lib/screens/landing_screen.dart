import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:late_box_book/blocs/user/bloc.dart';
import 'package:late_box_book/screens/home/home_scree.dart';
import 'package:late_box_book/screens/login/login_screen.dart';
import 'package:late_box_book/screens/splash/splash_screen.dart';

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  UserBloc _userBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _userBloc = BlocProvider.of<UserBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _userBloc,
      builder: (_, UserState state) {
        if (state is UserUnAuthenticatedState) {
          return LoginScreen();
        }else if(state is UserAuthenticatedState){
          return HomeScreen(state.mIsNewUser);
        }else if(state is UserAuthenticatedErrorState){
          return LoginScreen();
        }else{
          return SplashScreen();
        }
      },
    );
  }
}
