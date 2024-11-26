import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loginauth/login/sign_in.dart';
import 'package:loginauth/service/auth_services.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController userController = TextEditingController();
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
                controller: userController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  label: Text('Kullanıcı Adı'),
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              const SizedBox(height: 15),
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
                      Navigator.pop(context);
                    },
                    child: const Text('Hesabım Var'),
                  ),
                  const Spacer(),
                  OutlinedButton(
                    onPressed: () async {
                      await _services.signUp(
                        userController.text,
                        emailController.text,
                        passwordController.text,
                      );
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => const SignIn(),
                        ),
                      );
                      userController.clear();
                      emailController.clear();
                      passwordController.clear();
                    },
                    child: const Text('Kayıt Ol'),
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
