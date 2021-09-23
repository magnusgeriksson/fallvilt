import 'package:fallvilt/repositories/repositories.dart';
import 'package:fallvilt/screens/login_screen.dart';
import 'package:fallvilt/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/bloc.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
    required this.authenticationRepository,
    required this.userRepository,
  }) : super(key: key);

  final AuthenticationRepository authenticationRepository;
  final UserRepository userRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(
          value: authenticationRepository,
        ),
        RepositoryProvider<RegistrationRepository>(
          create: (context) => RegistrationRepository(),
        )
      ],
      child: BlocProvider(
        create: (_) => AuthenticationBloc(
          authenticationRepository: authenticationRepository,
          userRepository: userRepository,
        ),
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatefulWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  _AppViewState createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            primaryColor: const Color.fromRGBO(51, 126, 125, 1),
            primarySwatch: const MaterialColor(
              0xFF337E7D,
              <int, Color>{
                50: Color.fromRGBO(51, 126, 125, 1),
                100: Color.fromRGBO(51, 126, 125, 1),
                200: Color.fromRGBO(51, 126, 125, 1),
                300: Color.fromRGBO(51, 126, 125, 1),
                400: Color.fromRGBO(51, 126, 125, 1),
                500: Color(0xFFC3B5AF),
                600: Color(0xFFC3B5AF),
                700: Color(0xFFC3B5AF),
                800: Color(0xFFC3B5AF),
                900: Color(0xFFC3B5AF),
              },
            )),
        navigatorKey: _navigatorKey,
        builder: (context, child) {
          return BlocListener<AuthenticationBloc, AuthenticationState>(
            listener: (context, state) {
              switch (state.status) {
                case AuthenticationStatus.authenticated:
                  _navigator.pushAndRemoveUntil<void>(
                    MainScreen.route(),
                    (route) => false,
                  );
                  break;
                case AuthenticationStatus.unauthenticated:
                  _navigator.pushAndRemoveUntil<void>(
                    LoginScreen.route(),
                    (route) => false,
                  );
                  break;
                default:
                  break;
              }
            },
            child: child,
          );
        },
        onGenerateRoute: (_) => SplashScreen.route());
  }
}
