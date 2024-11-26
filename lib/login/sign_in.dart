import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loginauth/login/sign_up.dart';
import 'package:loginauth/service/auth_services.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final AuthServices _services = AuthServices();
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  label: Text('E-mail'),
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: passwordController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  label: Text('Password'),
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => SignUp(),
                        ),
                      );
                    },
                    child: const Text('Kayıt Ol'),
                  ),
                  const Spacer(),
                  OutlinedButton(
                    onPressed: () {
                      _services.signIn(
                        emailController.text,
                        passwordController.text,
                        context,
                      );
                    },
                    child: const Text('Giriş Yap'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
