import 'package:bloc_auth/bloc/auth_bloc.dart';
import 'package:bloc_auth/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GotoPage extends StatelessWidget {
  const GotoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final auth_01 = BlocProvider.of<AuthBloc>(context);
    return Scaffold(
      backgroundColor: Colors.brown,
      body: BlocConsumer<AuthBloc, AuthState>(listener: (context, state) {
        if (state is AuthInitial) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) {
                return HomePage();
              },
            ),
          );
        }
      }, builder: (context, state) {
        if (state is AuthLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                (state as AuthSuccess).uid,
                style: const TextStyle(fontSize: 20, color: Colors.white),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  auth_01.add(SignOut());
                },
                child: const Text("Sign out"),
              ),
            ],
          ),
        );
      }),
    );
  }
}
