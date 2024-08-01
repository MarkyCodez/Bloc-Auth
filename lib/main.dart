import "package:bloc_auth/bloc/auth_bloc.dart";
import "package:bloc_auth/pages/home_page.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Bloc Authentication",
        home: HomePage(),
      ),
    );
  }
}
