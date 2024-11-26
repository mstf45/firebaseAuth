import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loginauth/login/sign_in.dart';
import 'package:loginauth/service/auth_services.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    AuthServices authServices = AuthServices();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
          IconButton(
            onPressed: () async {
             await authServices.signOut();
              await Navigator.pushAndRemoveUntil(
                context,
                CupertinoPageRoute(
                  builder: (context) => SignIn(),
                ),
                (route) => false,
              );
            },
            icon: const Icon(Icons.exit_to_app),
          ),
        ],
      ),
      body: Center(
        child: Text('Giriş Yapan Kullanıcı Email: ${auth.currentUser!.email}'),
      ),
    );
  }
}
