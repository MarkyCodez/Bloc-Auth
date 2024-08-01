import 'package:bloc_auth/bloc/auth_bloc.dart';
import 'package:bloc_auth/components/text_field_component.dart';
import 'package:bloc_auth/pages/goto_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  final TextEditingController control_1 = TextEditingController();
  final TextEditingController control_2 = TextEditingController();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthFailure) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.error),
          ));
        }
        if (state is AuthSuccess) {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const GotoPage();
          }));
        }
      },
      builder: (context, state) {
        if (state is AuthLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.blue.shade300,
                  Colors.purple.shade300,
                ],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 300,
                ),
                const Text(
                  "Sign In",
                  style: TextStyle(
                    fontSize: 50,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFieldComponent(
                  textHint: "Enter Email",
                  textEditingController: control_1,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFieldComponent(
                  textHint: "Enter Password",
                  textEditingController: control_2,
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<AuthBloc>(context).add(
                      SignIn(
                        email: control_1.text.trim(),
                        password: control_2.text.trim(),
                      ),
                    );
                  },
                  child: const Text("Sign In"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
